#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
/*
run ms-settings:nightlight
WinWait Settings
Sleep, 2000
Send {Enter}
WinClose, Settings
*/

^+e::RegWrite, REG_BINARY, HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$$windows.data.bluelightreduction.bluelightreductionstate\Current, Data, 020000004db2fcef6a17d50100000000434201001000d00a02c614e39af2ffaeedc5ea0100
^+d::RegWrite, REG_BINARY, HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\$$windows.data.bluelightreduction.bluelightreductionstate\Current, Data, 0200000088313cdb4584d4010000000043420100d00a02c614dabef0d9dd88a1ea0100
return
/*
75%--------0200000006a01f5a1604d50100000000434201001000d00a02c614fca4fed0e582c1ea0100
65%--------020000004db2fcef6a17d50100000000434201001000d00a02c614e39af2ffaeedc5ea0100
50%--------02000000c52927ad6b17d5010000000043420100d00a02c614f9a79ce9baedc5ea0100
35%--------02000000626d54c96b17d50100000000434201001000d00a02c614cb92d1cabcedc5ea0100
25%--------02000000aca6a6d56b17d5010000000043420100d00a02c614a7b49aadbdedc5ea0100

*/