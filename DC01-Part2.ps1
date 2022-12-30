###################################################################
#
# .Description
# Create new forest and domain controller
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################
Start-Transcript -Path c:\Logs\dc1-part2.txt

$domainName = Read-Host "Enter a fully qualified domain name (ex. contoso.com, mydomain.ca, cety.org)"

Write-Host "When creating your domain be sure to save your SafeModeAdministratorPassword, it cannot be retrieved afterwards" -ForegroundColor Red
Pause


Install-ADDSForest -DomainName $domainName

Stop-Transcript