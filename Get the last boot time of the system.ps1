# Get the last boot time of the system
$lastBootTime = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty LastBootUpTime

# Calculate the time difference in days
$uptime = (Get-Date) - $lastBootTime
$daysSinceLastReboot = $uptime.Days

# Check if the system has been up for more than 7 days
if ($daysSinceLastReboot -gt 7) {
    $notificationTitle = "System Reboot Reminder"
    $notificationMessage = "Your computer has not been rebooted for more than 7 days. It's recommended to reboot your computer for optimal performance."
    $notificationOptions = New-BurntToastNotification -Text $notificationMessage -AppLogo 'C:\Logo.png'
    $notificationResult = $notificationOptions | Show-BurntToastNotification

    if ($notificationResult -eq "Activated") {
        Write-Host "User interacted with the notification."
    } else {
        Write-Host "Notification was not interacted with."
    }
} else {
    Write-Host "System has been rebooted within the last 7 days. No notification needed."
}
