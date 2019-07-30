#SingleInstance Force
#NoEnv
; USE THIS ALWAYS IF SCRIPT ONLY CONSISTS OF TIMERS
#Persistent ; DONOT FORGET THIS WHEN THERE IS NO HOTKEY OR OTHER THINGS TO KEEP THE SCRIPT ALIVE
			; OTHERWISE THE SCRIPT WILL CEASE ONCE THE RETURN IS ENCOUNTERED
SetTimer, checkTime, 3000000 ; Run timer subroutine every 50 mins(3,000,000 ms)
			; 	also instead of using sleep after pressing of in msgbox, using here cuz suspend wont suspend timers

checkTime: ; using loop increases cpu load by 10 -15 %
{

	if RegExMatch(A_Hour, "(22|23|24|01|02|03)", false, 1)
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
}

return
