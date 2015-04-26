# Turn off UAC, and change the script execution policy
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force
Set-ExecutionPolicy Unrestricted >$null 2>&1
