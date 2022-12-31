###################################################################
#
# .Description
# Script to prep a new server to become a domain controller
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

$ConfirmPreference = 'None'

Write-Host "The following steps will create a domain environment." -ForegroundColor DarkCyan 

Get-NetAdapter | Get-NetIPAddress | Remove-NetIPAddress -Confirm:$false
Get-NetAdapter | Remove-NetRoute
Get-NetAdapter | New-NetIPAddress -IPAddress '192.168.10.10' -PrefixLength '24' -DefaultGateway '192.168.10.1'
Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses ('127.0.0.1')

do {
$studentNumber = Read-Host "Enter your student number"
$studentNumberConfirmation = Read-Host "Is this your student number: $studentNumber (y/n)"
} until ($studentNumberConfirmation -eq 'y')

$dc1Name = "$studentNumber-DC1"

Rename-Computer -NewName $dc1Name -Force

Add-WindowsFeature -Name "AD-Domain-Services" -IncludeAllSubFeature -IncludeManagementTools  -LogPath 'C:\Logs\ad-domain-services.txt'
Add-WindowsFeature -Name "DNS" -IncludeAllSubFeature -IncludeManagementTools -LogPath 'C:\Logs\dns.txt'
Add-WindowsFeature -Name "gpmc" -IncludeAllSubFeature -IncludeManagementTools -LogPath 'C:\Logs\gpmc.txt'
Add-WindowsFeature -Name 'RSAT-AD-Tools' -LogPath 'C:\Logs\RSAT-AD-Tools.txt'

Write-Host "Reboot machine after confirmation"
Pause

Restart-Computer -Confirm



