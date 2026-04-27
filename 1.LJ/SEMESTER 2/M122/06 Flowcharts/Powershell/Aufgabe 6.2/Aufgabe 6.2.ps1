 $zahl = Read-Host "Gib eine Zahl ein"
 if ($zahl -gt 0) {
     Write-Host "Die Zahl ist positiv."
 } elseif ($zahl -lt 0) {
     Write-Host "Die Zahl ist negativ."
} else {
    Write-Host "Die Zahl ist null."
 } 
