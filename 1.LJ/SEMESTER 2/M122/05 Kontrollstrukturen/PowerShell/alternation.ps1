# Funktion welche zwei Zahlen übergibt, die kleinere wird zurückgegeben
function Get-Min {
    param (
        [int]$Number1,
        [int]$Number2
    )
    if ($Number1 -lt $Number2) {
        return $Number1
    }
    else {
        return $Number2
    }
}

$num1 = Read-Host "Zahl 1"
$num2 = Read-Host "Zahl 2"

if ([int]$num1 -lt [int]$num2) {
    Write-Host "Die kleinere Zahl ist: $num1"
}
elseif ([int]$num1 -eq [int]$num2) {
    Write-Host "Beide Zahlen sind gleich: $num1"
}
else {
    Write-Host "Die kleinere Zahl ist: $num2"
}

Write-Host "-----------------------------------------"
# task 3
function Compare-Numbers {
    param (
        [int]$Num1,
        [int]$Num2,
        [bool]$GetGreater
    )

    if ($GetGreater) {
        if ($Num1 -gt $Num2) { return $Num1 }
        else { return $Num2 }
    }
    else {
        if ($Num1 -lt $Num2) { return $Num1 }
        else { return $Num2 }
    }
}

$num1 = Read-Host "Zahl 1"
$num2 = Read-Host "Zahl 2"
$bitStr = Read-Host "Möchten Sie die größere Zahl zurückgeben? (True/False)"
$bit = [bool]::Parse($bitStr)
$result = Compare-Numbers -Num1 $num1 -Num2 $num2 -GetGreater $bit
Write-Host "Das Ergebnis ist: $result"

Write-Host "-----------------------------------------"
# Task 4
function Test-Sign {
    param (
        [int]$Val1,
        [int]$Val2
    )
    if (($Val1 -ge 0 -and $Val2 -ge 0) -or ($Val1 -lt 0 -and $Val2 -lt 0)) {
        return "Same"
    }
    else {
        return "Different"
    }
}
$num1 = Read-Host "Zahl 1"
$num2 = Read-Host "Zahl 2"
$result = Test-Sign -Val1 $num1 -Val2 $num2
Write-Host "Das Ergebnis ist: $result"

Write-Host "-----------------------------------------"
# Task 5
$ratingStr = Read-Host "Bitte geben Sie das Rating des Filmes (1-10) ein"
if ([int]$ratingStr -ge 1 -and [int]$ratingStr -le 10) {
    Write-Host "Vielen Dank für Ihr Feedback!"
}
else {
    Write-Host "Fehler: Der eingegebene Wert liegt außerhalb des gültigen Bereichs (1-10)."
}

Write-Host "-----------------------------------------"
# Task 6
$current_year = (Get-Date).Year
$input_yearStr = Read-Host "Bitte geben Sie eine Jahreszahl ein"
$input_year = [int]$input_yearStr
if ($input_year -lt $current_year) {
    Write-Host "Past"
}
elseif ($input_year -eq $current_year) {
    Write-Host "Now"
}
else {
    Write-Host "Future"
}

Write-Host "-----------------------------------------"
# Task 7
$ip_address = Read-Host "Bitte geben Sie die IP-Adresse ein, die Sie überprüfen möchten"
$test80 = Test-NetConnection -ComputerName $ip_address -Port 80 -InformationLevel Quiet -ErrorAction SilentlyContinue
$test443 = Test-NetConnection -ComputerName $ip_address -Port 443 -InformationLevel Quiet -ErrorAction SilentlyContinue

if ($test80 -or $test443) {
    Write-Host "Online"
}
else {
    Write-Host "Offline"
}