;~ #SingleInstance Force
;~ SetWorkingDir, C:\Users\%USERNAME%\AppData\Local\
#u::
Run, %ComSpec% /c "netsh wlan disconnect > C:\Users\%USERNAME%\AppData\Local\ahkfile1.txt",, Hide
Sleep, 1300  ; Sleep must be here cuz upper CMD command takes time to create file
file := FileOpen("C:\Users\" . USERNAME . "\AppData\Local\ahkfile1.txt", "r") ; open file and store the object in varaible
out := file.Read() ; read the file object
ToolTip, %out%, 60, 500, 1
file.close()

Run, %ComSpec% /c "netsh wlan show networks > C:\Users\%USERNAME%\AppData\Local\ahkfile2.txt",, Hide
Sleep, 1300
file := FileOpen("C:\Users\" . USERNAME . "\AppData\Local\ahkfile2.txt", "r") ; open file and store the object in varaible
out := file.Read() ; read the file object
ToolTip, %out%, 750, 300, 2
file.close()

Run, %ComSpec% /c "netsh wlan connect name=TP-LINK_7BBA > C:\Users\%USERNAME%\AppData\Local\ahkfile3.txt",, Hide
Sleep, 1300
file := FileOpen("C:\Users\" . USERNAME . "\AppData\Local\ahkfile3.txt", "r") ; open file and store the object in varaible
out := file.Read() ; read the file object
ToolTip, %out%, 1150, 500, 3
Sleep, 3500
ToolTip,,,, 1
ToolTip,,,, 2
ToolTip,,,, 3

file.close()

return

#y::
Run, %ComSpec% /c "netsh wlan disconnect > C:\Users\%USERNAME%\AppData\Local\ahkfile1.txt",, Hide
Sleep, 1300  ; Sleep must be here cuz upper CMD command takes time to create file
file := FileOpen("C:\Users\" . USERNAME . "\AppData\Local\ahkfile1.txt", "r") ; open file and store the object in varaible
out := file.Read() ; read the file object
ToolTip, %out%, 60, 500, 1
file.close()

Run, %ComSpec% /c "netsh wlan show networks > C:\Users\%USERNAME%\AppData\Local\ahkfile2.txt",, Hide
Sleep, 1300
file := FileOpen("C:\Users\" . USERNAME . "\AppData\Local\ahkfile2.txt", "r") ; open file and store the object in varaible
out := file.Read() ; read the file object
ToolTip, %out%, 750, 300, 2
file.close()

Run, %ComSpec% /c "netsh wlan connect name=A > C:\Users\%USERNAME%\AppData\Local\ahkfile3.txt",, Hide
Sleep, 1300
file := FileOpen("C:\Users\" . USERNAME . "\AppData\Local\ahkfile3.txt", "r") ; open file and store the object in varaible
out := file.Read() ; read the file object
ToolTip, %out%, 1150, 500, 3
Sleep, 3500
ToolTip,,,, 1
ToolTip,,,, 2
ToolTip,,,, 3

file.close()

return

