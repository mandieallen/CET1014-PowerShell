###################################################################
#
# .Description
# Script to create a new Hyper-V Virtual Machine
#
# .Author
# Mandie Allen
#
# .Verions
# 1.0 - Dec 12, 2022 - Script Creation
#
##################################################################

#declare global variables
$global:VHDDirectory = $null
$global:verifyPath = $null
$global:serverISOPath = $null
$global:win10ISOPath = $null

#create a new internal switch
function Create-Switch {
    New-VMSwitch -Name "CET1014 Internal Switch" -Notes "Internal Switch for CET1014 Virtual Machines" -SwitchType Internal
}

#get student number to for VM naming
do {
$studentNumber = Read-Host "Enter your student number"
$studentNumberConfirmation = Read-Host "Is this your student number: $studentNumber (y/n)"
} until ($studentNumberConfirmation -eq 'y')

#set VM names
$VMList = (
    "$studentNumber-CET1014-DC1",
    "$studentNumber-CET1014-SVR1",
    "$studentNumber-CET1014-Win10")

#get folder to save VM files
function Get-SavePath {
    do {
    $global:VHDDirectory = Read-Host "Enter a directory to save your VM files"
    Write-Output $global:VHDDirectory
    $global:verifyPath = Read-Host "Is this the correct directory? y/n"
    }
    until (Test-Path $global:VHDDirectory)
}

#get path to downloaded windows server iso
function Get-ServerISO {
    do {
    $global:serverISOPath = Read-Host "Enter the path to your Windows Server 2022 standard iso"
    Write-Output $global:serverISOPath
    }
    until (Test-Path $global:serverISOPath)
}

#get path to downloaded windows 10 iso
function Get-WindowsISO {
    do {
    $global:win10ISOPath = Read-Host "Enter the path to your Windows 10 iso"
    Write-Output $global:win10ISOPath
    }
    until (Test-Path $global:win10ISOPath)
}

#create hyper-V vm's
function Create-VM ($VMName, $VHDFolder) {
    do {
        $VmCreation = New-VM -Name $VMName `
                      -MemoryStartupBytes 2GB `
                      -BootDevice VHD `
                      -NewVHDPath $VHDFolder\$VMName.vhdx `
                      -Path $VHDFolder\VMData `
                      -NewVHDSizeBytes 40GB `
                      -Generation 2 `
                      -Switch "CET1014 Internal Switch" `                      
           
    } until (Test-Path $VHDPath)
}

Create-Switch
Get-SavePath
Get-ServerISO
Get-WindowsISO

#calls create-VM funtion to create VM and adds a dvd drive with path to iso for install
if ($global:verifyPath -eq 'y') {
    foreach ($vm in $VMList) {
        Create-VM -VMName $VM -VHDFolder $global:VHDDirectory
        if (($vm -eq "$studentNumber-CET1014-DC01") -or ($vm -eq "$studentNumber-CET1014-SVR")) {
        Add-VMDvdDrive -VMName $vm -Path $global:serverISOPath
        }
        elseif ($vm -eq "$studentNumber-CET1014-Win10"){
        Add-VMDvdDrive -VMName $vm -Path $global:win10ISOPath
        }
       }
}
