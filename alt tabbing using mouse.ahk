#SingleInstance,Force

;SendMode,Input
;AltTab and ShiftAltTab are special hotkeys made by ahk. need to be on same line.
;cant be used with send command
RButton & WheelDown::AltTab 
RButton & WheelUp::ShiftAltTab

/*
	while GetKeyState(RButton, "P")
	{
		WheelDown::
		Send, {alt Down}{Tab}
		return
		
		WheelUp::
		Send, {alt Down}+{Tab}
		return
		
	}
*/