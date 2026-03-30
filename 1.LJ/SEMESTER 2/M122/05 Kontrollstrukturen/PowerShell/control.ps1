$age = [int](Read-Host "Please enter your age") # Hier wird die Eingabe des Benutzers in eine Ganzzahl umgewandelt, damit sie für die Altersüberprüfung verwendet werden kann.
if ([int]($age -ge 18 -and $age -lt 100)) { # Das Int ist nicht notwendig, wenn die Eingabe bereits in eine Ganzzahl umgewandelt wurde (Was in Zeile 1 passiert.), da Read-Host einen String zurückgibt. Ohne die Umwandlung würde die Bedingung immer wahr sein, da Strings lexikografisch verglichen werden.
    Write-Host "You are an adult."
} 
elseif ($age -eq 17) {
    Write-Host "You are almost an adult."
}
else {
    Write-Host "You are a minor. Or you cannot be that old."
}