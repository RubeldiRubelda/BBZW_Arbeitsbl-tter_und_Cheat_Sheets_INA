
# Aufgabe 1: Einfache Benutzereingabe
while ($true) {
    $input = Read-Host "Geben Sie etwas ein (q zum Beenden)"
    if ($input -eq "q") {
        Write-Host "Programm wird beendet."
        break
    }
    Write-Host "Sie haben eingegeben: $input"
}

# Aufgabe 2: Filmbewertung
while ($true) {
    $rating = Read-Host "Bewerten Sie den Film (1-10, q zum Beenden)"
    if ($rating -eq "q") {
        Write-Host "Programm wird beendet."
        break
    }
    if ([int]$rating -ge 1 -and [int]$rating -le 10) {
        Write-Host "Danke für Ihre Bewertung: $rating"
    } else {
        Write-Host "Ungültige Bewertung. Bitte geben Sie eine Zahl zwischen 1 und 10 ein."
    }
}

# Aufgabe 3: Einmaleins
$number = Read-Host "Geben Sie eine Zahl ein, um die Einmaleins-Reihe zu berechnen"
$i = 1
while ($i -le 10) {
    $result = $number * $i
    Write-Host "$number x $i = $result"
    $i++
}

# Aufgabe 4: Funktion range
function range {
    param (
        [int]$num1,
        [int]$num2
    )
    if ($num1 -lt $num2) {
        $start = $num1
        $end = $num2
    } else {
        $start = $num2
        $end = $num1
    }
    for ($i = $start; $i -lt $end; $i++) {
        Write-Host -NoNewline "$i "
    }
    Write-Host
}
