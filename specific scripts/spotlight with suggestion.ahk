#SingleInstance Force
;~ SetBatchLines -1
DetectHiddenWindows, On
CoordMode, ToolTip, Screen

;~ dir := "C:\Users\nope\OneDrive\auto hot key\scite"
FileSelectFolder, dir, *C:\Users\%USERNAME%\Downloads,, Select a Folder. The files in that folder will be indexed and it can be searched.

;~ If Errorlevel
	;~ ExitApp

dir := RegExReplace(dir, "\\$") ; remove trailing fronslash if present


var1 := Object()
var2 := Object()

file := FileOpen("index.txt", "w`n")
Loop, files, %dir%\*.*, F
{
    SplitPath, % A_LoopFileName,,,, noExt
	file.WriteLine(noExt)
	var1[noExt] := A_Index
	var2[A_Index] := A_LoopFileLongPath
}
file.close()
MsgBox complete
noExt := ""

#space::
Gui, Destroy ; To stop control variable error.

Gui, -Caption +AlwaysOnTop -SysMenu +Owner
Gui, Font, s13 cblack, Consolas
Gui, Color, 0xD2EBFF, 0xD2EBFA
Gui, Add, Picture, x4 y3 w45 h-1, C:\Users\nope\Downloads\icon black.png
Gui, Add, Edit, -WantReturn x55 y12 r1 w450 vsearchTerm, SEARCH HERE
Gui Show, x580 y430 w520 h53, SpotLight
Gui, Add, Button, Default w0 h0, Ok
WinSet, Transparent, 190, SpotLight
SetTimer, searchTerm, 1000
return

searchTerm:
GuiControlGet, searchTerm,, searchTerm
Loop, read, index.txt
{
	if A_LoopReadLine contains %searchTerm%
	{
		; number of simultaneious tooltip cannot be greater than 20.
		if (A_Index <= 7) ; first 7 tooltip on left side
			ToolTip, %A_LoopReadLine%, 668 , % 470 + A_Index * 40, A_Index ; y increases at the rate of 40 pixels per loop
		if ((A_Index > 7) and (A_Index < 14)) ; another 7 tooltip on right side
			ToolTip, %A_LoopReadLine%, 1068 , % 470 + (A_Index - 7 ) * 40, A_Index ; A_index - 7 so that the left and right side are leveled
	}
	else if (A_Index < 20) ; when the searchterm doesnt match erase all tooltips
			ToolTip,,,, A_Index
}
return

ButtonOk:
GuiControlGet, searchTerm,, searchTerm

indexNumber := var1[searchTerm]
if indexNumber
{
	path := var2[indexNumber]
	run %path%
}
return

GuiEscape:
WinHide, A
SetTimer, searchTerm, Off ; Decrease CPU usage by stopping loop
i = 1
while (i < 20) ; Disable all tooltip
{
	ToolTip,,,, i
	i += 1
}
return

GuiClose:
WinHide, A
SetTimer, searchTerm, Off
i = 1
while (i < 20)
{
	ToolTip,,,, i
	i += 1
}
return
