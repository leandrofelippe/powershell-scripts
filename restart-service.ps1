param(
    [Parameter(Mandatory = $true)]
    [string]$ServiceName
)

try {
    $service = Get-Service -Name $ServiceName -ErrorAction Stop

    if ($service.Status -eq "Running") {
        Restart-Service -Name $ServiceName -Force
        Write-Host "Service '$ServiceName' restarted successfully."
    }
    else {
        Start-Service -Name $ServiceName
        Write-Host "Service '$ServiceName' started successfully."
    }
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
}
