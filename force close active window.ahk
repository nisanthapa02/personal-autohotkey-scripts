#SingleInstance Force

#!c::
; FIRST GET THE PROCESS ID (PID) OF THE CURRENT ACTIVE WINDOW
Winget, activePID, PID, A
WinGet, activeProcess, ProcessName, A
winget, activeID, ID, A

Process, Close, %activeProcess% 
Process, Close, %activePID% 
Process, Close, %activeID% 


return