; NOTICE HOW THIS SCRIPT DOESNT USE X AND Y COORDINATES WHILE WORKING ON GUIs
; noiceeeeee
#SingleInstance Force
SetWorkingDir, %A_ScriptDir%

^Esc::
listFile =

Gui, Font, s12
Gui, Add, Text,, Pick a file to launch from the list below.`nTo cancel, press ESCAPE or close this window.
Gui, Add, ListBox, vmyListBox gmyListBox w840 r16 ; so here are the full two ways used to store users input using GUI syntax
	; vmyListBox is used for Guicontrol syntax. see below.
	; gmyListBox is used as a sub-label if the user clicks the file.
	; r defines the window size by adjusting rows

Gui, Add, Button, Default, OK ; includes the word Default in its Options to make "OK" the default button

Loop, Files, C:\Users\%username%\OneDrive\auto hot key\*.*  ; Loop, Files, FilePattern(name or asterisk path), [mode]
{
    listFile = %listFile%%A_LoopFileTimeModified%`t%A_LoopFileName%|`n 
	; "|" is used at the end to make it work in Gui, ListBox
	; "`n" is used at the end to make Sort work
}
Sort, listFile, N R ; sort no. from lowest to highest in Reverse.
GuiControl,, myListBox, %listFile%
; GuiControl, Sub-command, ControlID(pref. control's var name over ClassNN), Value
; Leave SubCommand blank to put new contents into the control via Value. Specifically: pic,text,edit,progress...,
; A_LoopFilePath retreives the path and name of the file and folders currently reterived in the FilePattern option of Loop Syntax.
Gui, Show
return

myListBox: ; from above g-label
if (A_GuiEvent <> "DoubleClick"){ ; The type of event that launched the current thread.it contains one of the following strings:
									; normal(lclick) or DoubleClick or RightClick or ......
    return
}
; Otherwise, the user double-clicked a list item, so treat that the same as pressing OK.
; So fall through to the next label.

ButtonOK:
GuiControlGet, myListBox  ; Retrieve the ListBox's current selection.
							; If blank or omitted, it behaves as though the name of the output variable was specified. 
							; For example, GuiControlGet, MyEdit is the same as GuiControlGet, MyEdit,, MyEdit.
/*
We have named the selection in such a way that the the things we want to replace appears at first.
1.  now to make run work we have to remove the date from the item currently retereived just above by GuiControlGet
	the date will always be in format YYYYMMDDHHMMSS which is 14 char. long. and consists only of numbers.
	But the file name can also contain no. So we limit the no. of replacements to 14 so far.
2.  WE also have to remove the tab(`t) from the current selection. So we gotta add one more thing to replace.
  . we have 14 numbers and 1 tab making a total of 15 first occurence to replace and nomore.
  Hence, limit is 15

*/
myListBox := RegExReplace(myListBox, "[0-9]|`t", "",, 15) ; 15 is limit. see above.
Run, %myListBox%,, UseErrorLevel 
;If the launch fails, this option skips the warning dialog, sets ErrorLevel to the word ERROR, and allows the current thread to continue. 
; If the launch succeeds, RunWait sets ErrorLevel to the program's exit code, and Run sets it to 0.
if (ErrorLevel = "ERROR")
    MsgBox Could not launch the specified file. Perhaps it is not associated with anything.
return

GuiClose:
GuiEscape:
ExitApp