###################################################################
#
# .Description
# Show proof of Switch and VM creation
#
# .Author
# Mandie Allen
#
# .Verion
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

function Get-Proof {
    $hostname = hostname
    Write-Output $hostname
    Get-Vm | Select-Object vmname, vmid, dvddrives, path, computername
    Get-VMSwitch | Where-Object name -eq "CET1014 Internal Switch" | Select-Object name, notes, switchtype
}

$physicalPC = Read-Host "Are you running this script on your physical machine? (y/n)"
if ($physicalPC -ne 'y') {
    Write-Host "Script stopping! Please run this script on the machine that is hosting your VMs" -ForegroundColor Red
}
else {
    Get-Proof
}