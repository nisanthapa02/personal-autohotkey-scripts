;~ #SingleInstance,Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir, %A_WorkingDir%

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
SetKeyDelay, 35

if (!FileExist("C:\Users\%username%\Downloads\ahk"))
    FileCreateDir, C:\Users\%username%\Downloads\ahk
FileInstall, C:\Users\nope\OneDrive\auto hot key\install ffmpeg.ahk,C:\Users\%username%\Downloads\ahk\install ffmpeg.ahk


ToolTip, Press f7 to start

F7::
ToolTip, Buckle up Dont touch anything now.
Sleep, 1500

ToolTip, we are going to desktop first
Sleep, 900
Send, #d
ToolTip, Opening CMD as adminstration
SetTimer, fuckofftip, -5000
Sleep, 700
Send, #x
Sleep, 900
send, a
ToolTip, Press YES
SetTimer, fuckofftip, -6000
WinWaitActive, ahk_exe cmd.exe
if (ErrorLevel != 1)
{
	Sleep, 1000
	Send @"`%SystemRoot`%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=`%PATH`%;`%ALLUSERSPROFILE`%\chocolatey\bin"{Enter}
}

ToolTip, finish.

Sleep, 2000
ToolTip

ExitApp

fuckofftip:
ToolTip
return

