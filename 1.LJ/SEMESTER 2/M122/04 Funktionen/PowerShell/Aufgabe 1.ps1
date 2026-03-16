function greet($name) {
    Write-Host "Hello, $name!"
}
Read-Host "Enter your name:" | ForEach-Object { greet $_ }


## Get Time unteraufgabe

function get_time {
    $currentTime = Get-Date -Format "HH:mm:ss"
    return $currentTime
}
get_time