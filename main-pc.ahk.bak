#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetBatchLines,-1
ComObjError(0)
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
MajorVersion := DllCall("GetVersion") & 0xFF ; 10
IniRead,LastKnownUser,C:\Users\%A_UserName%\AppData\Local\VALORANT\saved\Config\Windows\RiotLocalMachine.ini,UserInfo,LastKnownUser
us:=LastKnownUser
loop
{
IniRead,LastKnownUser,C:\Users\%A_UserName%\AppData\Local\VALORANT\saved\Config\Windows\RiotLocalMachine.ini,UserInfo,LastKnownUser
if us !=LastKnownUser
{
	FileCopyDir,G:\My Drive\file share\val\extra\Windows , C:\Users\%A_UserName%\AppData\Local\VALORANT\Saved\Config\%LastKnownUser%\Windows , 1
	if MajorVersion = 88
	{
		SetBatchLines,50
	Send, {alt Down}
	Sleep 50
	 Send, {r Down}
            sleep 130
            Send, {r up}
			Sleep 50
	Send, {alt up}
	}
	break
}}

