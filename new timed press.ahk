#SingleInstance Force
#NoEnv
SendMode Input  
/*
-------------------------------------------------------------------------------------In upper block , if tilde button is pressed once then activates movie mode
-------------------------------------------------------------------------------------In lower block , if tilde is pressed for more then 0.5s and less then 1.7s then activate movie mode

-------------------------------------------------------------------------------------In upper block, after the 1.7s gone then automatically activates terminate no need to press furthur
-------------------------------------------------------------------------------------in lower block, it can be pressed >2s and <infinity activate terminate mode
*/
SC029::
KeyWait, SC029, T1.7
if (ErrorLevel != 0)
{
	ToolTip, terminate
	Sleep, 500
	ToolTip
	Run, C:\Users\nope\OneDrive\auto hot key\terminate.ahk
}
else
{
	Tooltip, MOVIEMODE
	Sleep, 500
	ToolTip
	Run, C:\Users\nope\OneDrive\auto hot key\movie mode.ahk
}
return

/*
VKC0::
start := A_TickCount
KeyWait, %A_ThisHotkey%
elap := A_TickCount - start

if ((elap > 700) and (elap < 1700)) {
	Tooltip,MOVIEMODE %elap%
	Sleep, 500
	ToolTip
	Run, C:\Users\nope\OneDrive\auto hot key\movie mode.ahk
}
else if (elap > 2000) {
	ToolTip, terminate %elap%
	Sleep, 500
	ToolTip
	Run, C:\Users\nope\OneDrive\auto hot key\terminate.ahk
}
return

*/
;```````````````````
	/*
	; To have a ToolTip disappear after a certain amount of time
	; without having to use Sleep (which stops the current thread):
	;#Persistent
	ToolTip, % A_TimeSinceThisHotkey
	;SetTimer, RemoveToolTip, -5000
	;return
	;RemoveToolTip:
	ToolTip
	;return
return
/*
