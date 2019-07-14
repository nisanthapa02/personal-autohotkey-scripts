
/*
full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
*/

#SingleInstance Force
#NoEnv
;~ SetWorkingDir, %A_ScriptDir%
;~ SendMode Input


;~ Run, PES2017.exe, C:\Program Files (x86)\Konami\Pro Evolution Soccer 2017
Run, PES2017 - Shortcut, D:
Run, Groove Music, D:, Max,
Run, C:\Users\nope\OneDrive\Documents\PES 2017\peswithhotkey.exe,, Hide
Run, C:\Users\nope\OneDrive\auto hot key\speedup PES.ahk


!f7::
Run, C:\Users\nope\Onedrive\Documents\PES 2017\trainer\trainer.exe
return

;#IfWinActive, ahk_exe PES2017.exe

/*
Ctrl::
toggle	:= !toggle

if (toggle = 0){
	ControlSend, Button1, {Space}, CETrainer
}
else{
	ControlSend, Button2, {Space}, CETrainer
}
return

SC00D::Send, {Volume_Up}
SC00C::Send, {Volume_Down}

return
*/

;#IfWinActive