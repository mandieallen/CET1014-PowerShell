#example menu
    function Show-Menu {
    Write-Host "`n~~~~~~~~~~~~~~~~~~~Menu~~~~~~~~~~~~~~~~~~" -foregroundcolor Blue

    Write-Host "`n1 - What processes are running on my computer?" -ForegroundColor Green
    Write-Host "2 - What is my computer name" -ForegroundColor Magenta
    Write-Host "3 - Exit" -foregroundcolor Cyan

}

do {
    Show-Menu
    $user_input = Read-Host "`n Please input your selection, 1 or 2 or press 3 to exit"
    switch ($user_input) {
        1 {
            Write-Host "`nYou have selected option 1." -ForegroundColor Green 
            Get-Process
        } 
        2 { 
            $env:COMPUTERNAME
            Write-Host "`nYou have selected option 2. `n`nYour computer name is $env:COMPUTERNAME`n" -ForegroundColor Magenta
        } 

        3 {
            Write-Host "`nExiting Program. Have a nice day! :) " -ForegroundColor Red
            return 
        }
    }
} until ($user_input -eq '3')