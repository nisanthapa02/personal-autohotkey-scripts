#SingleInstance Force
#NoEnv
#Persistent
SetTimer, checkTime, 3000000 ; Run timer subroutine every 50 mins(3,000,000 ms)
			; 	also instead of using sleep after pressing of in msgbox, using here cuz suspend wont suspend timers

checkTime: ; using loop increases cpu load by 10 -15 %

	FormatTime, ampm, A_Now, Time ; changes YYYYMMDDHH24MISS foramt to H(H):MM so that the hour can be detected easily 

	; RegEx explanation
	; () is used because it is common and makes code clean.
	; | is used as an "or".
	; then at the end is colon so that only the first two characters are searched( i.e only the hour not the minute)
	; cuz the hour is succeded by a colon but not in minute if only HH:MM is used

	if (InStr(ampm, "PM", False, 6) and RegExMatch(ampm, "(10|11):", False, 1)) or (InStr(ampm, "AM", False, 6) and RegExMatch(ampm, "(12|1|2|3):", False, 1))
	{
		CoordMode, Mouse, Screen
		;~ CoordMode, ToolTip, Screen
		MouseGetPos, oldX, oldY
		SplashTextOn, 600, 35, Shudown Timer, Move your mouse now to new location to prevent shutdown.
		Sleep, 2000
		SplashTextOff
		Sleep, 23000
		MouseGetPos, newX, newY
		if (oldX = newX) and (oldY = newY)
		{
			
			ToolTip, Shutting down
			SetTimer, checkTime, off
			;~ Shutdown, 1
		}
		else
		{
			;~ SetTimer, checkTime, On
			ToolTip, Shutdown cancelled
			Sleep, 1500
			ToolTip
		}
	}

return
