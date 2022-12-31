###################################################################
#
# .Description
# Show proof of domain, domain controller and settings
#
# .Author
# Mandie Allen
#
# .Verion
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

function Get-DC1PRoof {

    $hostname = hostname
    Write-output "`n $hostname"   
    Get-NetIPConfiguration    
    Get-ADDomain | Select-Object Forest, Name, netBIOSname, PDCEmulator    
    Get-ADDomainController | Select-Object Domain, IsGlobalCatalog, OperatingSystem
    Get-ADComputer -Filter * | Select-Object distinguishedName, Name, ObjectClass, ObjectGUID, SamAccountName    
    }

$physicalPC = Read-Host "Are you running this script on your domain controller VM? (y/n)"
if ($physicalPC -ne 'y') {
    Write-Host "Script stopping! Please run this script on your domain controller VM" -ForegroundColor Red
}
else {
    Get-DC1PRoof
}