function repeat ($Message) {
    Write-Host $Message
}

function report ($Message) {
    $timeStamp = Get-Date -Format "dd.MM.yyyy HH:mm"
    Write-Host "$timeStamp - $Message"
}

function log ($Message) {
    $timeStamp = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
    $logEntry = "$timeStamp - $Message"
    $logEntry | Out-File -FilePath ".\script.log" -Append -Encoding UTF8
}

function Get-Sum ($Zahl1, $Zahl2) {
    $ergebnis = [double]$Zahl1 + [double]$Zahl2
    Write-Host "Die Summe ist: $ergebnis"
}

function Compress-Path ($SourcePath) {
    # Erstellt einen Dateinamen basierend auf dem Quellnamen + .zip
    $destination = Join-Path -Path (Get-Location) -ChildPath "$((Get-Item $SourcePath).Name).zip"
    
    Compress-Archive -Path $SourcePath -DestinationPath $destination -Force
    Write-Host "Datei wurde gespeichert unter: $destination"
}

repeat "Hallo Welt"
report "Linux Kernel Version 1.0 was released"
log "Ein wichtiger Fehler ist aufgetreten"
Get-Sum 12.5 7.5
Compress-Path "C:\Users\benja\Desktop\text.txt"