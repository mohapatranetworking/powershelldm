# Prompt the user to restart with delay option
$choice = Read-Host "Your computer needs to be restarted. Do you want to restart now? (Y/N)"

if ($choice -eq 'Y' -or $choice -eq 'y') {
    Write-Host "Restarting computer..."
    # You can uncomment the line below to perform the immediate restart
    # Restart-Computer -Force
} elseif ($choice -eq 'N' -or $choice -eq 'n') {
    $delayMinutes = Read-Host "How many minutes would you like to delay the restart?"
    
    if ([int]::TryParse($delayMinutes, [ref]$null)) {
        Write-Host "Restart will be delayed by $delayMinutes minutes."
        Start-Sleep -Seconds ($delayMinutes * 60)
        Write-Host "Delay time has passed. Restarting computer..."
        # Uncomment the line below to perform the delayed restart
        # Restart-Computer -Force
    } else {
        Write-Host "Invalid input. Exiting script."
    }
} else {
    Write-Host "Invalid choice. Exiting script."
}
