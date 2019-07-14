#SingleInstance Force
#InstallMouseHook
SendMode Input

LButton::	
If (A_TimeSincePriorHotkey < 100) ;hyperclick
	return
Click Down
;~ Send {click}
;~ Send, {Click Down}
KeyWait, LButton
;~ Send, {Click Up}
Click Up
return

$MButton::
If (A_TimeSincePriorHotkey < 100) ;hyperclick
	Return
Send, {vk04}
;~ Click MButton
;~ Click MButton down
;~ KeyWait, MButton
;~ Click MButton up
Return

;~ $RButton::
;~ If (A_TimeSincePriorHotkey < 100) ;hyperclick
	;~ Return
;~ Send, {vk02}
Click RButton
Click RButton down
KeyWait, RButton
Click RButton up
;~ Return

