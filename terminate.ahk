/*
DetectHiddenWindows, On

path = %A_Desktop%\Test.ahk - AutoHotkey v1.1.26.01

path2 = %A_Desktop%\Test2.ahk - AutoHotkey v1.1.26.01

WinClose, %path%

WinClose, %path2%
*/


Path1 = C:\Users\nope\OneDrive\auto hot key\movie mode.ahk
Path2 = C:\Users\nope\OneDrive\auto hot key\speedup PES.ahk

DetectHiddenWindows, On
;WinClose, %Path1% ahk_class AutoHotkey
;PostMessage, 0x112, 0xF060,,, %Path1% ahk_class AutoHotkey
WinKill, %Path1% ahk_class AutoHotkey
WinClose, FreeMeter
WinKill, %Path2% ahk_class AutoHotkey
;~ WinKill, %Path1% ahk_class AutoHotkey
;~ WinKill, %Path1% ahk_class AutoHotkey
;~ WinKill, %Path1% ahk_class AutoHotkey
return