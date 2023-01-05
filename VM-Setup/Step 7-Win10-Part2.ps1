###################################################################
#
# .Description
# Add new workstation to a domain
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

$hostname = hostname

$domainName = Read-Host "Enter the fully qualified domain name of the domain you created"

Add-Computer -ComputerName $hostname -DomainName $domainName -Credential $domainName\Administrator 
Write-Host "Reboot machine after confirmation"
Pause

Restart-Computer -Confirm
