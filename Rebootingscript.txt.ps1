# Get the last boot time of the system
$lastBootTime = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty LastBootUpTime

# Calculate the time difference in days
$uptime = (Get-Date) - $lastBootTime
$daysSinceLastReboot = $uptime.Days

# Check if the system has been up for more than 7 days
if ($daysSinceLastReboot -gt 7) {
    Write-Host "System has not been rebooted for more than 7 days. Rebooting now..."
    # You can uncomment the line below to actually perform the reboot
    # Restart-Computer -Force
} else {
    Write-Host "System has been rebooted within the last 7 days. No reboot needed."
}



#Please be cautious when using scripts that perform automatic reboots, especially on production systems, as unexpected reboots can cause downtime and potential data loss. It's recommended to thoroughly test any such script in a controlled environment before deploying it in a production setting.

#Remember to uncomment the Restart-Computer line if you want the script to actually perform the reboot. As a safety measure, it's commented out in the script above.