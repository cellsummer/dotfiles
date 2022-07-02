# Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt -Theme space
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-Alias v nvim
Set-Alias py python

# function prompt {
#     $p = $executionContext.SessionState.Path.CurrentLocation
#     $osc7 = ""
#     if ($p.Provider.Name -eq "FileSystem") {
#         $ansi_escape = [char]27
#         $provider_path = $p.ProviderPath -Replace "\\", "/"
#         $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
#     }
#     "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
# }
function prompt {

    #Assign Windows Title Text
    $host.ui.RawUI.WindowTitle = "Current Folder: $pwd"

    #Configure current user, current folder and date outputs
    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $Date = Get-Date -Format 'dddd hh:mm:ss tt'

    # Test for Admin / Elevated
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    #Calculate execution time of last cmd and convert to milliseconds, seconds or minutes
    #$LastCommand = Get-History -Count 1
    #if ($lastCommand) { $RunTime = ($lastCommand.EndExecutionTime - $lastCommand.StartExecutionTime).TotalSeconds }

    #if ($RunTime -ge 60) {
    #    $ts = [timespan]::fromseconds($RunTime)
    #    $min, $sec = ($ts.ToString("mm\:ss")).Split(":")
    #    $ElapsedTime = -join ($min, " min ", $sec, " sec")
    #}
    #else {
    #    $ElapsedTime = [math]::Round(($RunTime), 2)
    #    $ElapsedTime = -join (($ElapsedTime.ToString()), " sec")
    #}

    #Decorate the CMD Prompt
    # Write-Host ""
    # Write-Host " USER:$($CmdPromptUser.Name.split("\")[1]) " -BackgroundColor DarkBlue -ForegroundColor White -NoNewline
    # If ($CmdPromptCurrentFolder -like "*:*")
    #     {Write-Host " $CmdPromptCurrentFolder "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline}
    #     else {Write-Host ".\$CmdPromptCurrentFolder\ "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline}

    # Write-Host " $date " -ForegroundColor White
    Write-Host "[" -NoNewline -ForegroundColor DarkRed
    Write-Host "$($CmdPromptUser.Name.split("\")[1])" -NoNewline -ForegroundColor Yellow
    Write-Host "@" -NoNewline -ForegroundColor DarkRed
    Write-Host "$CmdPromptCurrentFolder" -NoNewline -ForegroundColor Magenta
    Write-Host "]" -NoNewline -ForegroundColor DarkRed
    return "$ "
} #end prompt function
