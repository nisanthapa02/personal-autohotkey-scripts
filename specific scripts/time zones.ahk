#SingleInstance Force
#NoEnv
SendMode Input
; SetKeyDelay is not obeyed by SendInput; there is no delay between keystrokes in that mode. This same is true for Send when SendMode Input is in effect.
;~ SetKeyDelay, 60

;~ MsgBox, 4096, , READY? `n Press ok.
;~ MsgBox, 4096, ,"Firstly, Right click timezones.exe. `n Then, copy that file. `n Then press ok."
;~ Loop
;~ {
;~ MsgBox, 4100, , Did you copy the file?
;~ IfMsgBox, Yes
	;~ break
;~ IfMsgBox, No
	;~ MsgBox, 4096, , Copy it again
;~ }
;~ Sleep, 500

;~ #Persistent
;~ ToolTip, Now we are gonna open run and start typing
;~ SetTimer, removeToolTip, -3000

;~ send, {LWin Down}r{LWin Up}
;~ Sleep, 500
;~ SendEvent, shell:common startup{Enter}
;~ MsgBox, Now right click in the newly opened window and paste it.
;~ MsgBox % "Now just press windows key + t to see time zones."

;~ removeToolTip:
;~ ToolTip
;~ return

;~ return

#t::

UTCTime := A_NowUTC
;localTime := A_Now

;ET = local time - 09:45
ETTime := A_NowUTC
;ETTime = 	;Make it blank so that the below will use the current time instead.
ETTime += -4, Hours 	;newETTime will be 585 minutes behind current time.

;PT = local time - 12:45
PTTime := A_NowUTC
PTTime += -7, Hours

;UTC - 05:00
texasTime := A_NowUTC
texasTime += -5, Hours

;UTC + 2hrs
barcelonaTime := A_NowUTC
barcelonaTime += 2, Hours

;UTC+05:30
;indiaTime := A_NowUTC
;indiaTime += 330, Minutes

FormatTime, UTC, %UTCTime%
;FormatTime, local, %localTime%
FormatTime, ET, %ETTime%
FormatTime, PT, %PTTime%
;FormatTime, india, %indiaTime%
FormatTime, texas, %texasTime%
FormatTime, barcelona, %barcelonaTime%

MsgBox, 
(
UTC Time is:  	%UTC%
Eastern Time is: 	%ET%
Pacific Time is:	%PT%
Texas :		%texas%
Barcelona : 	%barcelona%
)
;Local Time is: 	%local%
;India Time is: 	%india%	
return


