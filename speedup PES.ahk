#SingleInstance Force

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
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#IfWinActive, ahk_exe PES2017.exe

toggle := 0
return

Control::
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


/*
7::
ControlSend, Button1, {Space}, CETrainer
return

8::
ControlSend, Button2, {Space}, CETrainer
;ControlClick, x1105 y252, Untitled - Notepad, , Left
return
*/