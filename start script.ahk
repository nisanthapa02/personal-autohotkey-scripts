;~ Suspend, Permit
;One Script to run and stop all other scripts
#SingleInstance Force
#NoEnv

;~ SendMode Input
CoordMode, ToolTip, Screen
username := "nope"
;===================================================
Sleep, 1000
Run, media.ahk, "C:\Users\%username%\OneDrive\auto hot key"
Run, C:\Users\%username%\OneDrive\auto hot key\buggy mouse short.ahk

Sleep, 3000
Run, C:\Users\%username%\OneDrive\auto hot key\type.ahk
Run, C:\Users\%username%\OneDrive\auto hot key\new timed press.ahk

Sleep, 4000
Run, C:\Users\%username%\OneDrive\new windows if\PROGRAMS\clipjump\Clipjump_x64.exe

;=============================== METERD CONNECTION =======================

metered := 0

f4::
metered := !metered

if (metered)
{
	Run, %ComSpec%  /c netsh wlan set profileparameter name="TP-LINK_7BBA" cost="Fixed",, Hide
	ToolTip, Metered, 960, 540
	Sleep, 1500
	ToolTip
}
else
{
	Run, %ComSpec% /c netsh wlan set profileparameter name="TP-LINK_7BBA" cost="Unrestricted",, Hide
	ToolTip, Unmetered, 960, 540
	Sleep 1500
	ToolTip
}
return


;============================Wi-fi change===================================

far =
(Join&&
@echo off
echo disconnecting wifi
netsh wlan disconnect
echo ================
timeout /t 5
@echo connecting to TP-LINK 7BBA
netsh wlan connect name=TP-LINK_7BBA
echo =================
echo completed
exit
)

near =
(Join&&
@echo off
echo disconnecting wi-fi
netsh wlan disconnect
echo ============     
timeout /t 5
echo connecting to SSID "A"
netsh wlan connect name=A
echo =============
echo Completed
exit
)

#y::
ToolTip, Running near
Run, %ComSpec% /k %near%,, Hide
ToolTip, complete
Sleep 500
ToolTip
;Run, SSID near.bat, "C:\Users\%username%\OneDrive\auto hot key"
return

#u::
ToolTip runnning far
Run, %ComSpec% /k %far%,, Hide
ToolTip complete
Sleep 500
ToolTip
;Run, SSID far.bat, "C:\Users\%username%\OneDrive\auto hot key"
return

;~ =============================	Brightness  =====================================

!Up::
Run nircmd.exe changebrightness +10
ToolTip, +10, 960, 540
SetTimer, remBrightness, 1500
return

!Down::
Run nircmd.exe changebrightness -10
ToolTip, -10, 960, 540
SetTimer, remBrightness, 1500
return

remBrightness:
ToolTip
return
;==================== Always On Top ==================================


s := 0
return

#Lbutton::

s := !s

if (s = 0){
	;~ ToolTip
	ToolTip, AOT off
	
	SetTimer, removeTip, -2000
	;WinSet, AlwaysOnTop, On
	
}
else{
	;~ ToolTip
	ToolTip, AOT On
	
	SetTimer, removeTip, -2000
	;WinSet, AlwaysOnTop, Off
}

;~ WinGet, activewin, ProcessName, A
Sleep, 500
WinSet, AlwaysOnTop, Toggle, A
;~ MsgBox %activewin%
return

removeTip:
ToolTip
Return

;======================================================

^Insert::
Run, C:\Users\%username%\OneDrive\auto hot key\PES and others.ahk
return

#c::
Run calc.exe
return

^+0::
Run, "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
return

;============= KILL PROCESS ========================================
#!c::
; FIRST GET THE PROCESS ID (PID) OF THE CURRENT ACTIVE WINDOW
Winget, activePID, PID, A
;~ WinGet, activeProcess, ProcessName, A
;~ winget, activeID, ID, A
;~ Process, Close, %activePID% 
;~ Process, Close, %activeProcess% 
;~ Process, Close, %activeID%
;~ WinClose, A
Run, nircmd.exe killprocess /%activePID%
return
;========== Alt tabbing =========================================

;~ RButton & WheelDown::AltTab 
;~ RButton & WheelUp::ShiftAltTab


; ======================Send a Suspend command to another script.=================
#!s::
DetectHiddenWindows, On
WM_COMMAND := 0x111
ID_FILE_SUSPEND := 65404
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\%username%\OneDrive\auto hot key\PES and others.ahk ahk_class AutoHotkey
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\%username%\OneDrive\auto hot key\new timed press.ahk ahk_class AutoHotkey
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\%username%\OneDrive\auto hot key\media.ahk ahk_class AutoHotkey
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\%username%\OneDrive\auto hot key\type.ahk ahk_class AutoHotkey
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\%username%\OneDrive\auto hot key\movie mode.ahk ahk_class AutoHotkey
PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, C:\Users\%username%\OneDrive\auto hot key\buggy mouse short.ahk ahk_class AutoHotkey
;PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, ahk_class AutoHotkey
;PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, ahk_class AutoHotkey
;PostMessage, WM_COMMAND, ID_FILE_SUSPEND,,, ahk_class AutoHotkey
return
;============================================================

#!x::
DetectHiddenWindows, On 
WinGet, List, List, ahk_class AutoHotkey 
Loop %List% ; retrieves the  ID of the specified windows, one at a time
{ 
    WinGet, PID, PID, % "ahk_id " List%A_Index% 
    If ( PID <> DllCall("GetCurrentProcessId") ) 
		PostMessage,0x111,65405,0,, % "ahk_id " List%A_Index% 
}
return


;=================================================================

;; KEEP THIS DOWN

#IfWinActive, ahk_exe Explorer.exe
^+n::
Run, notepad.exe
return
#IfWinActive

