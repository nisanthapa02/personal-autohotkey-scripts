#SingleInstance Force
#NoEnv
; USE THIS ALWAYS IF SCRIPT ONLY CONSISTS OF TIMERS
#Persistent ; DONOT FORGET THIS WHEN THERE IS NO HOTKEY OR OTHER THINGS TO KEEP THE SCRIPT ALIVE
			; OTHERWISE THE SCRIPT WILL CEASE ONCE THE RETURN IS ENCOUNTERED

chooseTime:
Gui +AlwaysOnTop
Gui, Add, ComboBox,R11 vwaitMinute x104 y73 w106 h9 , 5|10|15|30||60|120|180|240|300|360|600
Gui, Font, s11
Gui, Add, Text, x8 y6 w335 h71 , Select the time (in minutes) or input manually.`nAfter the time has elapsed`, this computer will close.
Gui, Font
Gui, Add, Button, x26 y209 w96 h29 , Ok ; Could have used g-label here
Gui, Add, Button, x200 y209 w96 h29 , Cancel
; Generated using SmartGUI Creator for SciTE
Gui, Show, w314 h249, Shutdown Timer
return

ButtonOk:
Gui, Submit
Gui, Destroy
waitMinute := waitMinute * 60000
Sleep, %waitMinute%
Gui +AlwaysOnTop
Gui, Font, s11
Gui, Add, Text, x15 y6 w357 h48 , Closing PC in 15 seconds. To disable shutdown, press Disable.
Gui, Add, Button, x131 y73 w96 h29 , Disable
; Generated using SmartGUI Creator for SciTE
Gui, Show, w389 h118, shutting down
;~ Sleep, 15000
SetTimer, shuttDdown, -15000
return

shuttDdown:
Shutdown, 1
return

ButtonDisable:
Gui, Destroy
SetTimer, shuttDdown, Off
gosub, chooseTime
return

ButtonCancel:
GuiClose:
ExitApp
return


