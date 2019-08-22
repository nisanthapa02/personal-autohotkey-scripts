#SingleInstance Force
;~ SetBatchLines -1
DetectHiddenWindows, On

;~ dir := "C:\Users\nope\OneDrive\auto hot key\batch file"

FileSelectFolder, dir, *C:\Users\%USERNAME%\Downloads,, Select a Folder. The files in that folder will be indexed and it can be searched.

If Errorlevel
	ExitApp

dir := RegExReplace(dir, "\\$") ; remove trailing fronslash if present

var1 := Object()
var2 := Object()

Loop, files, %dir%\*.*, F
{
    SplitPath, % A_LoopFileName,,,, noExt
	var1[noExt] := A_Index
	var2[A_Index] := A_LoopFileLongPath
}
SetTimer, removeTipAgain, 3000
ToolTip, Press WinKey + SpaceBar to bring up Spotlight. Press Enter to search. 

#space::
Gui, Destroy
;~ Gui, Show
Gui, -Caption +AlwaysOnTop -SysMenu +Owner
Gui, Font, s13 cblack, Consolas
Gui, Color, 0xD2EBFF, 0xD2EBFA
Gui, Add, Picture, x4 y3 w45 h-1, C:\Users\nope\Downloads\icon black.png
Gui, Add, Edit, -WantReturn x55 y12 r1 w450 vsearchTerm, SEARCH HERE.
Gui Show, x580 y430 w520 h53, SpotLight
Gui, Add, Button, Default w0 h0, Ok
WinSet, Transparent, 190, SpotLight
;~ SetTimer, searchTerm, 4900
;~ GuiControl, +Center, searchTerm
return

;~ #space::
;~ WinShow, SpotLight
;~ Gui, Show
;~ return

ButtonOk:
;~ searchTerm:
GuiControlGet, searchTerm,, searchTerm

indexNumber := var1[searchTerm]
if indexNumber
{
	path := var2[indexNumber]
	run %path%
	SetTimer, removeTipAgain, -3000
	ToolTip, "Running" %path%
	}
return

removeTipAgain:
ToolTip
return

GuiEscape:
WinHide, A
;~ Gui, Show, Minimize
;~ Gui, Hide
return

GuiClose:
WinHide, A
return
