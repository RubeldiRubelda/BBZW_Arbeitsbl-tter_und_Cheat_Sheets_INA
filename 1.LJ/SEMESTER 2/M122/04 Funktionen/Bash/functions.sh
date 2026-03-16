## ODER AU SO - Übergabe per Numerischen Parameter
function doPrintName() ##Keine Textvariablen
{
    echo "$1 isch top"
}
doPrintName "Gugus"



## ODER AU SO - Ganz ohne Variablen
function doPrintName() 
{
    echo "Gugus isch top"
}
doPrintName



function doPrintName()
{
    echo "$1 $2 isch top"
    return $ret
}
str=$(doPrintName "Gugus" "Test")
echo $str



function doGetYear()
{
    ret="hi $1 $2"
    return 2026
}
