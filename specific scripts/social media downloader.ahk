#SingleInstance, Force
#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


global vidQuality := ""
global vidSize := ""

clipChanged(Type) 
{
	If InStr(Clipboard, "https://www.youtube.com/watch?v=") Or InStr(Clipboard, "https://youtu.be/") Or InStr(Clipboard, "http://southpark.cc.com/") Or InStr(Clipboard, "https://twitter.com/") Or InStr(Clipboard, "https://www.instagram.com/p/") Or RegExMatch(Clipboard, "r/.*/comments/", 24) Or RegExMatch(Clipboard,".*/status/", 32) Or RegExMatch(Clipboard, "k.com/.*/vid", 20)
	{
		ToolTip, Supported Link Found in Clipboard
		SetTimer, removeToolTip, -5000
		
		Menu Tray, Icon, shell32.dll, 35
		
		Gui +AlwaysOnTop
		Gui Add, Button, gselectAudio x5 y115 w169 h47, &Audio
		Gui Add, Button, gselectVideo x202 y119 w169 h47, &Video
		Gui Add, Button, gselectnon x416 y119 w169 h47, &Non-youtube sites
		Gui Add, Button, x204 y198 w169 h47, &Cancel
		Gui Add, Text, x48 y36 w512 h57 +0x200, Download Audio Or Video? If the site is not youtube select "Non-youtube Sites"
		Gui Show, w592 h265, Downloaders
		Return
		
		selectAudio:
		Gui Submit
		Gui, Destroy
		arg = --output `%(track)s-`%(artist)s-`%(id)s.`%(ext)s -f "m4a/best audio" --embed-thumbnail
		Run, %ComSpec% /c "youtube-dl %arg% %Clipboard% && pause", , Min
		Return
		
		selectVideo:
		Gui Submit
		Gui, Destroy
		Gui, +AlwaysOnTop
		Gui, Add, Text, x22 y19 w540 h40 , Select the video resolution you `n would like to download:	 		
		Gui, Add, Text, x356 y19 w540 h40 , Restrict the file size below: `n (You can also add your own)
		Gui, Add, DropDownList, R9 VvidQuality x52 y79 w100 h10 , 144p|240p|360p|480p|720p||1080p|1440p|2160p|4320p
		Gui, Add, ComboBox, R9 VvidSize x372 y79 w100 h10 , 30mb|50mb|100mb|150mb|200mb|500mb|1000mb|2500Mb|5000mb|| 
		Gui, Add, Button, x222 y239 w90 h30 , OK ; Acts as a GOSUB  fuction to ButtonOK label
		Gui, Show, w550 h274, downloader  
		return
		
		ButtonOK:
		Gui, Submit
		Gui Destroy
		; Just FOUND OUT THAT DONT NEED RegExReplace()TO REMOVE WORDS, CAN USE 720P AND 300MB
		;vidQuality := RegExReplace(vidQuality, ".$", "") ; REMOVE p from 720p
		;vidSize := RegExReplace(vidSize, ".$", "") ; remove b from 1000Mb
		arg = -f "[height <= ? %vidQuality%][filesize < %vidSize%]" ; Dont escape percentage signs
		;MsgBox %arg%
		Run, %ComSpec% /c "youtube-dl %arg% %Clipboard% && pause", , Min
		return
		
		selectnon:
		Gui Submit
		Gui, Destroy
		arg := ""
		Run, %ComSpec% /c "youtube-dl %arg% %Clipboard% && pause", , Min
		return
		
		
		ButtonCancel:
		GuiEscape:
		GuiClose:
		ExitApp
		
		removeToolTip:
		ToolTip
		return
	}
	else
	{
		ToolTip, No link Found
	}
}

; THIS CODE SHOULD BE FIRST THAN THE Bottom CODE CAUSE THE BOTTOM CODE HAS RETURN
Try {
    Run, youtube-dl, , Hide
	ToolTip, Checking if youtube-dl is downloaded or not
	ToolTip
} 
Catch {	 ;	Specifies the code to execute if an exception is raised during execution of a try statement.
	ToolTip, Downloading youtube-dl first
    URLDownloadToFile, https://yt-dl.org/latest/youtube-dl.exe, youtube-dl.exe
	ToolTip
    If !FileExist("youtube-dl.exe") {
        ExitApp, 1
    }
}

OnClipboardChange("clipChanged")
return
