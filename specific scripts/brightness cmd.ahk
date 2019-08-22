
brightness = 50

^Up::
brightness += 10
if (brightness > 100)
	brightness = 100
powerCMD =
(Join&
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %brightness%
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %brightness%
powercfg -S 381b4222-f694-41f0-9685-ff5bb260df2e
)
;~ MsgBox % brightness
Run, %ComSpec% /k %powerCMD%,, Hide
ToolTip, +10
SetTimer, removeTip, -2000
return

^Down::
brightness -= 10
if (brightness < 0)
	brightness = 0
powerCMD =
(Join&
powercfg -SetAcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %brightness%
powercfg -SetDcValueIndex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %brightness%
powercfg -S 381b4222-f694-41f0-9685-ff5bb260df2e
)
;~ MsgBox % brightness
Run, %ComSpec% /k %powerCMD%,, Hide
ToolTip -10
SetTimer, removeTip, -2000
return






