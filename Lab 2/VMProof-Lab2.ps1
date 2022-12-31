###################################################################
#
# .Description
# Create new forest and domain controller
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

Get-Proof