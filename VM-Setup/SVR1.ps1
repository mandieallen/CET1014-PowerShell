###################################################################
#
# .Description
# Script to rename a server and join it to a domain
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

Start-Transcript -Path c:\Logs\SVR1Creation.txt


Write-Host "The following steps will rename your server and prep it to be added to your domain." -ForegroundColor DarkCyan 

Get-NetAdapter | Get-NetIPAddress | Remove-NetIPAddress -WarningAction Continue
Get-NetAdapter | Remove-NetRoute
Get-NetAdapter | New-NetIPAddress -IPAddress '192.168.10.11' -PrefixLength '24' -DefaultGateway '192.168.10.1'
Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses ('192.168.10.10')

do {
$studentNumber = Read-Host "Enter your student number"
$studentNumberConfirmation = Read-Host "Is this your student number: $studentNumber (y/n)"
} until ($studentNumberConfirmation -eq 'y')

$SVR1Name = "$studentNumber-SVR1"

Rename-Computer -NewName $SVR1Name -Force

Stop-Transcript

Restart-Computer -Confirm