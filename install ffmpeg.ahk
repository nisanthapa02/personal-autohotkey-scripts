#SingleInstance,Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetKeyDelay, 100
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
;{
    ;try ; leads to having the script re-launching itself as administrator
    ;{
        ;if A_IsCompiled
            ;Run *RunAs "%A_ScriptFullPath%" /restart
        ;else
            ;Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    ;}
    ;ExitApp
;}

ToolTip, opening cmd Press Yes
SetTimer, removeTip, -5000
command1 = 
(Join&&
choco install -y youtube-dl
echo =============================================
echo Completed youtube-dl download and installation
echo =============================================
choco install  -y ffmpeg
echo =============================================
echo Completed ffmpeg download and installation
echo =============================================
choco list --local-only
echo if youtube-dl and ffmpeg are listed above, then install successful
echo =============================================
echo exiting in 8 Seconds
timeout /t 8
)

Run, *RunAs %ComSpec% /k %command1%

removeTip:
ToolTip
return