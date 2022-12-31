###################################################################
#
# .Description
# Script to rename a windows 10 machine and join it to the domain
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

$ConfirmPreference = 'None'

Write-Host "The following steps will rename your workstation and prepare it to add to your domain." -ForegroundColor DarkCyan 

Get-NetAdapter | Get-NetIPAddress | Remove-NetIPAddress -Confirm:$false
Get-NetAdapter | Remove-NetRoute
Get-NetAdapter | New-NetIPAddress -IPAddress '192.168.10.50' -PrefixLength '24' -DefaultGateway '192.168.10.1'
Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses ('192.168.10.10')

do {
$studentNumber = Read-Host "Enter your student number"
$studentNumberConfirmation = Read-Host "Is this your student number: $studentNumber (y/n)"
} until ($studentNumberConfirmation -eq 'y')

$Win10Name = "$studentNumber-Win10"

Rename-Computer -NewName $Win10Name -Force

Write-Host "Reboot machine after confirmation"
Pause

Restart-Computer -Confirm
