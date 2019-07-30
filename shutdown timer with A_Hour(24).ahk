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
		MsgBox, 4096, Shutdown Timer, Are you still there? If yeah`, press Ok.`nI (PC) will shutdown if you don't do anything for 10 Mins. , 600
		
		IfMsgBox, Ok
		{
			return ; if pressed ok than return
			;~ Sleep, 3600000
		}
		IfMsgBox, TIMEOUT
		{
			SetTimer, checkTime, Off ; if no response within 10 mins then shutdown PC
			Shutdown, 1
		}
	}
}

return
