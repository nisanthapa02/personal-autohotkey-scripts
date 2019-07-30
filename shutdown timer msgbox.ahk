#SingleInstance Force
#NoEnv
; USE THIS ALWAYS IF SCRIPT ONLY CONSISTS OF TIMERS
#Persistent ; DONOT FORGET THIS WHEN THERE IS NO HOTKEY OR OTHER THINGS TO KEEP THE SCRIPT ALIVE
			; OTHERWISE THE SCRIPT WILL CEASE ONCE THE RETURN IS ENCOUNTERED
SetTimer, checkTime, 3000000 ; Run timer subroutine every 50 mins(3,000,000 ms)
			; 	also instead of using sleep after pressing of in msgbox, using here cuz suspend wont suspend timers

checkTime: ; using loop increases cpu load by 10 -15 %
{
	FormatTime, ampm, A_Now, Time ; changes YYYYMMDDHH24MISS foramt to H(H):MM so that the hour can be detected easily 

	; RegEx explanation
	; () is used because it is common and makes code clean.
	; | is used as an "or".
	; then at the end is colon so that only the first two characters are searched( i.e only the hour not the minute)
	; cuz the hour is succeded by a colon but not in minute if only HH:MM is used

	if (InStr(ampm, "PM", False, 6) and RegExMatch(ampm, "(10|11):", False, 1)) or (InStr(ampm, "AM", False, 6) and RegExMatch(ampm, "(12|1|2|3):", False, 1))
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
