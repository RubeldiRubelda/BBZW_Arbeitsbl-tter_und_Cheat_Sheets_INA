$summe = 0
while ($true) {
    $eingabe = Read-Host "Gib eine Nummer ein (oder 'Q' zum Beenden)"
    if ($eingabe -eq "Q") {
        break
    } elseif ($eingabe -match "^-?\d+$") {
        $summe += [int]$eingabe
        Write-Host "Aktuelle Summe: $summe"
    } else {
        Write-Host "Ungültige Eingabe. Bitte gib eine Zahl oder 'Q' ein."
    }
}
Write-Host "Die Summe aller eingegebenen Nummern ist: $summe"