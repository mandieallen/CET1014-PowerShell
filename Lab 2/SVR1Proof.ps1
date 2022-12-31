###################################################################
#
# .Description
# Show proof of server and settings
#
# .Author
# Mandie Allen
#
# .Verion
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

function Get-SVR1PRoof {

    $hostname = hostname
    Write-output "`n $hostname"
    Get-NetIPConfiguration    
    }

$physicalPC = Read-Host "Are you running this script on your SVR1 VM? (y/n)"
if ($physicalPC -ne 'y') {
    Write-Host "Script stopping! Please run this script on your SVR1 VM" -ForegroundColor Red
}
else {
    Get-SVR1PRoof
}