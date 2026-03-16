Funktionen mit $ variablen arbeiten. Die Erhaltenen Argumente mit $(Nummerierung) in Funktionen nutzen. 

## Beispiel
```
function doPrintName()
{
    echo "$1 isch top"
}
doPrintName "Gugus"
```


## Beispiel mit mehreren Argumenten
```
function doPrintName($name)
{
    echo "$1 $2 isch top"
}
doPrintName "Gugus" "Test"
```


## Rückgabe
Return in Bash kann nur Zahlen zurückliefern.
```
function doPrintName()
{
    echo "$1 $2 isch top"
    return $ret
}
str=$(doPrintName "Gugus" "Test")
```


Return in Bash gibt nue von 0 - 255 zurück

```

function doGetYear()
{
    ret="hi $1 $2"
    return 2026
}
echo $?
```