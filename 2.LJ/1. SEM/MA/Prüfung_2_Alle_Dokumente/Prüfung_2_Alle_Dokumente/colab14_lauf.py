import gzip, urllib.request, os, math, random, time, json, numpy as np, torch
from torch import nn, optim
from torch.utils.data import DataLoader, TensorDataset, Subset, random_split
base="https://raw.githubusercontent.com/zalandoresearch/fashion-mnist/master/data/fashion/"
def get(n):
    if not os.path.exists(n): urllib.request.urlretrieve(base+n,n)
    return gzip.open(n).read()
def imgs(n): return torch.from_numpy(np.frombuffer(get(n),np.uint8,offset=16).copy()).view(-1,1,28,28).float()/255
def lbls(n): return torch.from_numpy(np.frombuffer(get(n),np.uint8,offset=8).copy()).long()
Xtr,ytr=imgs("train-images-idx3-ubyte.gz"),lbls("train-labels-idx1-ubyte.gz")
Xte,yte=imgs("t10k-images-idx3-ubyte.gz"),lbls("t10k-labels-idx1-ubyte.gz")
device=torch.device("cpu"); torch.set_num_threads(4)
full=TensorDataset(Xtr,ytr)
train_subset,validation_subset,_=random_split(full,[6000,2000,len(full)-8000],generator=torch.Generator().manual_seed(42))
demo_subset=Subset(train_subset,range(512))
batch_size=64; comparison_epochs=6; run_seed=7
class M(nn.Module):
    def __init__(s,h=128):
        super().__init__(); s.flatten=nn.Flatten()
        s.linear_relu_stack=nn.Sequential(nn.Linear(784,h),nn.ReLU(),nn.Linear(h,10),nn.LogSoftmax(dim=1))
    def forward(s,x): return s.linear_relu_stack(s.flatten(x))
lf=nn.NLLLoss()
def loader(d,shuffle=False,seed=run_seed): return DataLoader(d,batch_size=batch_size,shuffle=shuffle,generator=torch.Generator().manual_seed(seed))
def ev(m,l):
    m.eval();tl=c=t=0
    with torch.no_grad():
        for x,y in l:
            o=m(x);tl+=lf(o,y).item()*len(y);c+=(o.argmax(1)==y).sum().item();t+=len(y)
    return dict(loss=tl/t,accuracy=100*c/t,correct=c,total=t)
cp=lambda m:{k:v.detach().clone() for k,v in m.state_dict().items()}
def run(name,lr,h,ep,data=train_subset,seed=run_seed):
    torch.manual_seed(seed);random.seed(seed)
    m=M(h);opt=optim.Adam(m.parameters(),lr=lr)
    tl=loader(data,True,seed);tc=loader(data);vl=loader(validation_subset)
    hist=[];best=1e9;be=None;bs=None;fs=None
    for e in range(1,ep+1):
        m.train()
        for x,y in tl:
            l=lf(m(x),y);opt.zero_grad();l.backward();opt.step()
        a=ev(m,tc);b=ev(m,vl)
        hist.append(dict(epoch=e,train_loss=a['loss'],validation_loss=b['loss'],train_accuracy=a['accuracy'],validation_accuracy=b['accuracy']))
        if e==1: fs=cp(m)
        if b['loss']<best: best=b['loss'];be=e;bs=cp(m)
    return dict(name=name,lr=lr,h=h,hist=hist,best_epoch=be,best_state=bs,first_state=fs,params=sum(p.numel() for p in m.parameters()))
R={}
base_run=run("E1",0.001,128,6)
lrs={0.001:base_run}
for lr in [0.0001,0.01]: lrs[lr]=run("E2",lr,128,6)
over=run("E3",0.003,256,50,demo_subset)
best_lr=min(lrs,key=lambda v:lrs[v]['hist'][-1]['validation_loss'])
widths={128:lrs[best_lr]}
for h in [16,256]: widths[h]=run("E4",best_lr,h,6)
best_h=min(widths,key=lambda v:widths[v]['hist'][-1]['validation_loss'])
sel=widths[best_h]
tm=M(128);tm.load_state_dict(base_run['first_state']);ref=ev(tm,loader(TensorDataset(Xte,yte)))
sm=M(sel['h']);sm.load_state_dict(sel['best_state']);se=ev(sm,loader(TensorDataset(Xte,yte)))
out=dict(E1=base_run['hist'],E2={str(k):v['hist'] for k,v in lrs.items()},E3=over['hist'],E3best=over['best_epoch'],
 best_lr=best_lr,E4={str(k):dict(hist=v['hist'],params=v['params']) for k,v in widths.items()},best_h=best_h,sel_best_epoch=sel['best_epoch'],ref=ref,sel=se)
json.dump(out,open("results.json","w"),indent=1)
print("best_lr",best_lr,"best_h",best_h,"epoch",sel['best_epoch']);print(ref,se)
