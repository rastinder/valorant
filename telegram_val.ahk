NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
ComObjError(0)
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
TelegramBotToken =
TelegramBotChatID =
gudigudi:= ScanSubnet()
telev()
{
	return 4
} ; version
Process, Priority, , L
RunAsAdmin()

MajorVersion := DllCall("GetVersion") & 0xFF ; 10
MinorVersion := DllCall("GetVersion") >> 8 & 0xFF ; 0
BuildNumber := DllCall("GetVersion") >> 16 & 0xFFFF ; 10532

Drive = G:\My Drive\file share
if !FileExist(Drive)
	Drive = C:\Users\%A_Username%\Documents\share\file share
if !FileExist(Drive)
	Drive = C:\Users\Administrator\Google Drive\file share
if !FileExist(Drive)
	Drive = C:\Users\Admin\Google Drive\file share
OutputDebug %Drive%

global Users :=[] ,enter := "%0A", pc :=[] ,Drive,dailysummary,weeklysummary
logins :=[]
weeklysummary = 1
cmkey = cmdkey /add:%A_ComputerName% /user:%A_UserName% /pass:'
;IniWrite,%A_TickCount%,%Drive%/val/extra/progress.ini,last_active,%A_UserName%

/*
IfExist \\2700-pc\C\DLL\Users.ini
{
	loop, Read,\\2700-pc\C\DLL\logins.ini
	{
		logins.push(A_LoopReadLine) ;
	}
	v := HasVal(logins,cmkey)
	OutputDebug v=%v%
	if (v = 0)
		FileAppend,%cmkey%`n, \\2700-pc\C\DLL\logins.ini
	loop % logins.Maxindex()
	{
		cmkey := login[A_Index]
		RunWait,%cmkey% ,,hide
	}

	loop, Read,\\2700-pc\C\DLL\Users.ini
	{
		Users.push(A_LoopReadLine) ;
	}
	v := HasVal(Users,A_UserName)
	OutputDebug v=%v%
	if (v = 0)
		FileAppend,%A_UserName%`n, \\2700-pc\C\DLL\Users.ini

	loop, Read,\\2700-pc\C\DLL\pc.ini
	{
		pc.push(A_LoopReadLine) ;
	}
	v := HasVal(pc,A_ComputerName)
	OutputDebug v=%v% ,
	if (v = 0)
		FileAppend,%A_ComputerName%`n, \\2700-pc\C\DLL\pc.ini

	gudigudi:= ScanSubnet()
	v := HasVal(gudigudi,A_ComputerName)
	OutputDebug v=%v%
	if (v = 3)
	{
		RunWait netsh winsock reset catalog,,hide
		RunWait netsh int ip reset reset.log,,hide
		RunWait ipconfig /flushdns,,hide
		RunWait ipconfig /registerdns,,hide
		RunWait route /f,,hide
		;shutdown,6
	}
}
else
	sendmsg("remote pc not found")
*/
#include <json>																; Coco's JSON library, get it here:   https://autohotkey.com/boards/viewtopic.php?t=627
global botToken,chatID
botToken := ""					; add your Telegram bot token
chatID := 																	; add your chat ID for testing porposes

oCustomers := {}																; Object of user ids of registered customers -> add your customers, you can send them a personal registration link
oCustomers[chatID] := "My Name"											; add your chat id (and name) to the customer object for testing purposes
offset := ""																			; Telegram message offset

OutputDebug `n good to go `n

cmds := {	"status" : "somefunction_status"										; bundle commands (case insensitive) and corresponding script functions to call   ;   ethe word te ode corespondece koi funtion name
	, 	"Ping" : "somefunction_ping"
	, "need_update" : "need_update"
	, "Reboot" : "reboot"
	, "force_update" : "force_update"
	, 	"Show" : "inlinebuttons"
	, "Find":"find"
	,"Run":"execute"
	, "ini":"Edit1"
, 	"Remove" : "RemoveKeyb" }

; add custom keyboard for testing
keyb=																		; json formatted string
(
	{"keyboard":[ ["status", "ping"],["need_update", "reboot"], ["Show inline buttons", "Remove Keyboard"] ], "resize_keyboard" : true }
)
;url := "https://api.telegram.org/bot" botToken "/sendMessage?chat_id=" chatID "&reply_markup=" keyb
url := "https://api.telegram.org/bot" botToken "/sendMessage?text="A_ComputerName " is up&chat_id=" chatID "&reply_markup=" keyb

;url := "https://api.telegram.org/bot" botToken "/sendMessage?text=Keyboard added&chat_id=" chatID "&reply_markup=" keyb
json_message := URLDownloadToVar(url)
; msgbox % json_message

; Check for new updates
SetTimer, UpdateTimer, 1000					; every 1000 ms = 1 second
SetTimer, halfhourupdate, 1800000
;SetTimer, hourlyupdate, 7200000 ;3600000
;SetTimer, Shutdowntimer, 21600000 ;3600000
;SetTimer, hourlyupdate2, 7200000
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Esc::ExitApp
; hit Escape to stop the script
!a::sendphoto()
return
!g::sendmsg("1")
return
::btw::
	MsgBox, You typed btw.
return
!f::Pause
;----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
halfhourupdate:
text = ""
	IniRead, last_match, settings.ini,logs , last_match
	if (last_match = last_match1)
	{

		Length := StrLen(A_UserName)
		word = % SubStr(A_UserName, Length, 1)
		text = %A_UserName% no match found in 30 mins
		RunWait, %A_ScriptDir%\IrfanView\i_view64.exe /capture=1 /silent /convert= %A_ScriptDir%\save_me\2.png
        location = %A_ScriptDir%\save_me\2.png
        IniWrite,%location%,settings.ini,tele_notes,pic
		Iniwrite,%text%,settings.ini,tele_notes,msg
		sendphoto()
		sleep 100
		;Telegram_MsgBox(0,a,text)
		;RunWait, Taskkill /FI USERNAME eq A_UserName /IM zack.exe /F /T ,,hide
		;run c:\Users\%A_Username%\Documents\jatt\zack.ahk
		kill_epic()
		force_update()
		ExitApp

	}
	last_match1 := last_match
	text = ""
Return
/*
hourlyupdate:
	text = ""
	IniRead, last_match, settings.ini,SectionName , last_match
	if (last_match = last_match1)
	{

		Length := StrLen(A_UserName)
		word = % SubStr(A_UserName, Length, 1)
		IniRead,shutdown,settings.ini,SectionName,shutdown
		if(shutdown = 1)
		{
			if (word != 2 ) ; and A_ComputerName != 2700-pc)
			{

				text = %A_UserName% no match found in past hour	shutdown
				Telegram_MsgBox(0,a,text)
				sleep 2000
				Shutdown,6
			}
			else
			{
				text = %A_UserName% no match found in past hour	logoff
				Telegram_MsgBox(0,a,text)
				sleep 2000
				shutdown,0
			}
		}
		;shutdown,0
	}
	last_match1 := last_match
	;IfInString,A_UserName,2700_1_1
	; {
	;		text := ping()
	;		Telegram_MsgBox(0,a,text)
	;	}
	;
	;IfInString,A_UserName,2700
	;	{
	;		Loop , % users.MaxIndex()
	;			{
	;				user := users[A_Index]
	;				IfInString,user,00
	;				{}
	;				else
	;					{
	;						ini = \\%user%-PC\Users\%user%\Documents\15-15\settings.ini
	;						IniRead, last_match, %ini%,SectionName , last_match
	;						if ( last_match == "ERROR")
	;							{}
	;						else{
	;						if (last_match = last_match_%User%)
	;							{
	;
	;								text = %user% no match found in past hour
	;								Telegram_MsgBox(0,a,text)
	;							}
	;						last_match_%User% := last_match
	;						ggg = last_match_%User%
	;						zzz := last_match_%User%
	;						OutputDebug last_match %ggg% = %zzz% `n
	;						}
	;					}
	;			}
	;	}

	text = ""
return
*/
UpdateTimer:																									; checks constantly for user input in your bot
	stack := {}																										; message stack

	updates := GetUpdates(botToken, (offset+1))											; get (new) updates from your bot as JSON string; keep track of old messages
	;msgbox % updates
	oUpdates := JSON.Load(updates)											; create an AHK object from the JSON string
	If oUpdates.ok																			; check if json answer was "ok" : true
	{

		loop % oUpdates.result.MaxIndex()		; determine number of new messages (updates)
			stack.Push(oUpdates.result[A_index])		; add all updates (=messages) to stack
		For key, msg in stack
		{
			from_id := first_name := mtext := last_name := username := ""
			if (msg.callback_query.data!="")									; inline buttons have to be handled differently than normal messages and normal keyboards
			{
				from_id := msg.callback_query.from.id
				mtext := msg.callback_query.data
			}
			else 																					; get message text or message from normal keyboard
			{
				from_id := msg.message.from.id									; which ID sent the message?
				mtext := msg.message.text
				;first_name := msg.message.from.first_name
				;last_name := msg.message.from.last_name
				;username ;=  msg.message.from.username
			}
			offset := msg.update_id													; keep track of processed messages

			if oCustomers.Haskey(from_id)				; check for known users...   optional
			{
				word_array := StrSplit(mtext, A_Space, ".")
				word := word_array[1]
				OutputDebug mtext = %mtext% ,word = %word% `n
				if cmds.Haskey(word)														; is message a known command?
				{
					fun := cmds[word]									;look up which function to call for a specific command
					%fun%(botToken, msg, from_id, mtext)			; call function
				}
				else if (word == "version") or if (word == "Version")
				{
					tele := telev()
					IniRead,version,settings.ini,config,version
					Text = script=%version% tele=%telev% %A_UserName%
					Telegram_MsgBox(0,a,Text)
					;IfInString
					;text := "Sorry... I don't know this command."
					;    url encoding for messages :  %0A = newline (\n)   	%2b = plus sign (+)		%0D for carriage return \r        single Quote ' : %27			%20 = space
					;SendText(botToken, text, from_id)
				}
			}
			else
				Traytip, No, Unknown user, 3
		} ; end 'for'
	}

	if a_hour = 00
	{
		if (dailysummary = 1)
		{
			pday := A_WDay - 1
			if pday = 0
			{
				pday = 7
				weeklysummary = 1
			}
			IniRead,matchesperday,settings.ini,week,%pday%
			dailysummary = 0
			text = %a_username%, %enter% match/day = %matchesperday%
			OutputDebug %text%
			Telegram_MsgBox(0,a,text)
			if 	(A_WDay = 2 and weeklysummary = 1)
			{
				weeklysummary = 0
				total = 0
				loop,7
				{
					IniRead,matchesperday,settings.ini,week,%A_Index%
					total := total + matchesperday
				}
				text = %a_username%, %enter% match/week = %total%
				Telegram_MsgBox(0,a,text)
			}
		}
	}
	else if (dailysummary != 1)
		dailysummary = 1
	IfWinExist, Error
	{
		return ; function not usefull
		RunWait, %A_ScriptDir%\IrfanView\i_view64.exe /capture=1 /silent /convert= %A_ScriptDir%\save_me\2.png
        location = %A_ScriptDir%\save_me\2.png
        IniWrite,%location%,settings.ini,tele_notes,pic
		text = gc crash %A_UserName%
		Iniwrite,%text%,settings.ini,tele_notes,msg
		sendphoto()
		run,G:\My Drive\file share\val\val_start.ahk
		kill_epic()
		ExitApp
	}
return


/*
Shutdowntimer:

	text = ""
	IniRead, last_match, settings.ini,SectionName , last_match
	if (last_match = last_match2)
	{
		text = %A_UserName% no match found in past hour
		plz_sut = 1
		Telegram_MsgBox(0,a,text)
		;shutdown,0
	}
	else
		plz_sut = 0
	last_match2 := last_match
	IfInString,A_UserName,2700_1_1
	{
		text := ping()
		Telegram_MsgBox(0,a,text)
	}

	IfInString,A_UserName,2700
	{
		Loop , % users.MaxIndex()
		{
			user := users[A_Index]
			IfInString,user,00
				{}
			else
			{
				ini = \\%user%-PC\Users\%user%\Documents\15-15\settings.ini
				IniRead, last_match, %ini%,SectionName , last_match
				if ( last_match == "ERROR")
					{}
				else{
					if (last_match = last_match_%User%)
					{

						text = %user% no match found in 6 hour
						Telegram_MsgBox(0,a,text)
					}
					last_match_%User% := last_match
					ggg = last_match_%User%
					zzz := last_match_%User%
					OutputDebug last_match %ggg% = %zzz% `n
				}
			}
		}
	}

	text = ""
	if (plz_sut = 1)
	{
		sendmsg("no match found in 6 hrs")
		Sleep 2500
		Shutdown, 6
	}
return
*/
;--------------------------------------------------------  functions for user commands ---------------------------------------------------------------------------------------------------------
somefunction_status(botToken, msg, from_id, mtext)
{
	Random,rand,2000,3999
	Sleep %rand%
	if (msg.callback_query.id!="")						;  After the user presses a callback button, Telegram clients will display a progress bar until you call answerCallbackQuery
	{
		cbQuery_id := msg.callback_query.id
		; Notification and alert are optional
		url := "https://api.telegram.org/bot" botToken "/answerCallbackQuery?text=Notification&callback_query_id=" cbQuery_id "&show_alert=true"
		json_message := URLDownloadToVar(url)
		;msgbox % json_message
	}
	text := status()
	;SendText(botToken, text, from_id) ;  url encoding for messages :  %0A = newline (\n)   	%2b = plus sign (+)		%0D for carriage return \r        single Quote ' : %27			%20 = space
return
}
somefunction_ping(botToken, msg, from_id, mtext)
{
	Random,rand,2000,3999
	Sleep %rand%
	if (msg.callback_query.id!="")						;  After the user presses a callback button, Telegram clients will display a progress bar until you call answerCallbackQuery
	{
		cbQuery_id := msg.callback_query.id
		; Notification and alert are optional
		url := "https://api.telegram.org/bot" botToken "/answerCallbackQuery?text=Notification&callback_query_id=" cbQuery_id "&show_alert=true"
		json_message := URLDownloadToVar(url)
		;msgbox % json_message
	}
	IfInString,A_UserName,2700_1_1
	{
		text := ping()
		SendText(botToken, text, from_id) ;  url encoding for messages :  %0A = newline (\n)   	%2b = plus sign (+)		%0D for carriage return \r        single Quote ' : %27			%20 = space
	}
return
}
need_update(botToken, msg, from_id, mtext)
{
	Random,rand,2000,3999
	Sleep %rand%
	if (msg.callback_query.id!="")						;  After the user presses a callback button, Telegram clients will display a progress bar until you call answerCallbackQuery
	{
		cbQuery_id := msg.callback_query.id
		; Notification and alert are optional
		url := "https://api.telegram.org/bot" botToken "/answerCallbackQuery?text=Notification&callback_query_id=" cbQuery_id "&show_alert=true"
		json_message := URLDownloadToVar(url)
		;msgbox % json_message
	}
	IfInString,A_UserName,2700
	{
		Loop , % users.MaxIndex()
		{
			user := users[A_Index]
			;odebug = %apid%
			IfInString,user,00
				{}
			else
			{
				ini = \\%user%-PC\Users\%user%\Documents\15-15\settings.ini
				Iniwrite, 1, %ini%,SectionName , restart
				puser = %puser% updating %user%	%enter%
			}
		}
	}
	Iniwrite, 1, settings.ini,config , restart
	text = updating %A_UserName% %enter% %puser%
	SendText(botToken, text, from_id) ;  url encoding for messages :  %0A = newline (\n)   	%2b = plus sign (+)		%0D for carriage return \r        single Quote ' : %27			%20 = space
return
}
force_update(botToken = 0, msg = 0, from_id = 0, mtext = 0)
{
	IniRead,force_updates,G:/My Drive/file share/val/extra/progress.ini,%A_UserName%,%A_NowUTC%
	if (A_NowUTC - force_updates > 1500)
	{
	IniWrite,%A_NowUTC%,G:/My Drive/file share/val/extra/progress.ini,force_updates,%A_UserName%
	run,G:\My Drive\file share\val\val_start.ahk
	kill_epic()
	ExitApp
	}
}
find(botToken, msg, from_id, mtext)
{
	Random,rand,2000,3999
	text := A_UserName
	Sleep %rand%
	word_array := StrSplit(mtext, A_Space, ".")
	word := word_array[2]
	IfInString,word,pr1
	{

		loop, Read,Username.txt
		{
			currentUser := StrSplit(A_LoopReadLine, ",")
			,currentpr := currentUser[3]
			,currentrank := currentUser[2]
			OutputDebug %A_LoopReadLine% `n
			OutputDebug currentpr %currentpr% & currentrank %currentrank% `n
			If (currentpr=="1" and currentrank=="Unranked")
			{
				text .= "%0A"A_LoopReadLine
			}
		}
	}
	else
	{
		;Usernames:=[]
		loop, Read,Username.txt
		{
			currentUser := StrSplit(A_LoopReadLine, ",")
			,currentUser := currentUser[1]
			IfInString,currentUser,%word%
			{
				text = %A_LoopReadLine% found in
				break
			}
		}
	} ; else
	text = %text% %A_UserName% %A_ComputerName%
	SendText(botToken, text, from_id) ;  url encoding for messages :  %0A = newline (\n)   	%2b = plus sign (+)		%0D for carriage return \r        single Quote ' : %27			%20 = space
}

sendphoto()
{
	IniRead,strings,settings.ini,tele_notes,msg
	IniRead,SelectedFile,settings.ini,tele_notes,pic
	text = %A_UserName% = %strings%
	SendPhoto2(botToken, chatID, Selectedfile,text) 	; send the image; use msgbox for checking the json response
}

Edit1(botToken, msg, from_id, mtext)
{
	mtext := StrReplace(mtext, "`r`n")
	output:= StrSplit(mtext,",")
	OutputDebug % output.MaxIndex()
	If InStr(mtext,A_UserName) or output.MaxIndex() = 5
	{
		output:= StrSplit(mtext,",")
		readwrite := output[1]
		outputv := output[2]
		file := output[3]
		scename := output[4]
		readvariable := output[5]
		If  InStr(readwrite,"read")
		{
			iniread,outputv,%file%,%scename%,%readvariable%
			Value := outputv
		}
		else
		{
			Iniwrite,%outputv%,%file%,%scename%,%readvariable%
			Value = written
		}
		text = %Value% %A_UserName%
		SendText(botToken, text, from_id)
	}
}
execute(botToken, msg, from_id, mtext)
{
	output:= StrSplit(mtext,"Run")
	function:= output[2]
	function1 := output[1]
	OutputDebug `n %function1% `n %function%
	FileDelete,temp.ahk
	this =     strings = string Value empty
	FileAppend,%this% `n , temp.ahk
	FileAppend, %function% `n , temp.ahk
	;................................send_telegram().............................
	this = send_telegram(strings,pic := "0")
	;~ FileAppend,`n %this% `n { `n , temp.ahk
	this := "IniWrite,%strings%,settings.ini,tele_notes,msg"
	FileAppend,%this% `n , temp.ahk
	this =     if pic = 0
	FileAppend,%this% `n , temp.ahk
	this =     {
	FileAppend,%this% `n , temp.ahk
	this =         send {alt down}
	FileAppend,%this% `n , temp.ahk
	this =         Sleep 50
	FileAppend,%this% `n , temp.ahk
	this =         send {g}
	FileAppend,%this% `n , temp.ahk
	this =         Sleep 50
	FileAppend,%this% `n , temp.ahk
	this =         send {alt up}
	FileAppend,%this% `n , temp.ahk
	this = }
	FileAppend,%this% `n , temp.ahk
	this = else
	FileAppend,%this% `n , temp.ahk
	this = {
	FileAppend,%this% `n , temp.ahk
	this = RunWait, %A_ScriptDir%\IrfanView\i_view64.exe /capture=1 /silent /convert= %A_ScriptDir%\telegram\1.png
	FileAppend,%this% `n , temp.ahk
	location = %A_ScriptDir%\telegram\1.png
	;~ IniWrite,%location%,settings.ini,tele_notes,pic
	this = send {alt down}
	FileAppend,%this% `n , temp.ahk
	this = Sleep 50
	FileAppend,%this% `n , temp.ahk
	this = send {a}
	FileAppend,%this% `n , temp.ahk
	this =Sleep 50
	FileAppend,%this% `n , temp.ahk
	this =send {alt up}
	FileAppend,%this% `n , temp.ahk
	this = }
	FileAppend,%this% `n , temp.ahk
	;................................send_telegram().............................

	Run,temp.ahk
}
kill_epic()
{
    RunWait Taskkill /IM VALORANT-Win64-Shipping.exe /F
    RunWait Taskkill /IM VALORANT.exe /F
    RunWait Taskkill /IM UnrealCEFSubProcess.exe /F
    RunWait Taskkill /IM RiotClientUx.exe /F
    RunWait Taskkill /IM RiotClientServices /F
}
;--------------------------------------------------------------------
; add inline buttons
inlinebuttons(botToken, msg, from_id, mtext="")
{
	keyb=																	; json string:
	(
		{"inline_keyboard":[ [{"text": "Command One" , "callback_data" : "status"}, {"text" : "Some button (Cmd3)", "callback_data" : "Command3"} ] ], "resize_keyboard" : true }
	)
	url := "https://api.telegram.org/bot" botToken "/sendMessage?text=Keyboard added&chat_id=" from_id "&reply_markup=" keyb
	json_message := URLDownloadToVar(url) ; find this function at the next code box below
return json_message
}
;---------------------------------------------------------------------
; Remove custom keyboard
RemoveKeyb(botToken, msg, from_id, mtext="")
{
	keyb=
	(
		{"remove_keyboard" : true }
	)
	url := "https://api.telegram.org/bot" botToken "/sendMessage?text=Keyboard removed&chat_id=" from_id "&reply_markup=" keyb
	json_message := URLDownloadToVar(url)
	;msgbox % json_message
return
}
;------------------------------------------  Telegram functions  --------------------------------------------------------------------------------------------------------
GetUpdates(token, offset="", updlimit=100, timeout=0)
{
	If (updlimit>100)
		updlimit := 100
	; Offset = Identifier of the first update to be returned.
	url := "https://api.telegram.org/bot" token "/getupdates?offset=" offset "&limit=" updlimit "&timeout=" timeout
	updjson := URLDownloadToVar(url)
return updjson
}
;------------------------------------------------
SendText(token, text, from_id, replyMarkup="", parseMode="" )
{
	OutputDebug `n %text%
	url := "https://api.telegram.org/bot" token "/sendmessage?chat_id=" from_ID "&text=" text "&reply_markup=" replyMarkup "&parse_mode=" parseMode
	json_message := URLDownloadToVar(url)
return json_message
}
;----------------------------------- additional functions ------------------------------------------------------------------------------------------------------------------
URLDownloadToVar(url,ByRef variable=""){						; function originally by Maestrith, I think
	try																						; keep script from breaking if API is down or not reacting
	{
		hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
		;hObject:=ComObjCreate("MSXML2.XMLHTTP.6.0")
		hObject.Open("GET",url)
		hObject.Send()
		variable:=hObject.ResponseText
		;variable= {"ok":true,"result":{"message_id":62,"from":{"id":1331062094,"is_bot":true,"first_name":"Fearbot","username":"Rastinderbot"},"chat":{"id":706316494,"first_name":"American","last_name":"Sniper","type":"private"},"date":1597871292,"text":"Keyboard added"}}
		;OutputDebug %variable%
		return variable
	}
}

status()
{

	IfInString,A_UserName,2700_1_1
	{
		;loop, Read,\\2700-pc\C\DLL\Users.ini
		;	{
		;		Users.push(A_LoopReadLine) ;
		;	}
		Loop , % users.MaxIndex()
		{
			user := users[A_Index]
			;odebug = %apid%
			IfInString,user,00
				{}
			else
			{
				RunWait cmdkey /add:%user%-pc /user:%user% /pass:' ,,hide
				ini = \\%user%-PC\Users\%user%\Documents\15-15\settings.ini
				IniRead, set, %ini%,SectionName , set
				IniRead, last_match, %ini%,SectionName , last_match
				IniRead, matchcount, %ini%,SectionName , matchcount
				if ( last_match == "ERROR")
					continue
				else
					this = %this% %user%>set=%set%,matches=%matchcount%,lastest=%last_match% %enter%
			}
		}
	}
	IniRead, user, settings.ini,user , user
	IniRead, lvl, settings.ini,user , lvl
	IniRead, last_match, settings.ini,logs , last_match
	;IniRead, count, settings.ini,logs , count
			RunWait, %A_ScriptDir%\IrfanView\i_view64.exe /capture=1 /silent /convert= %A_ScriptDir%\save_me\2.png
        location = %A_ScriptDir%\save_me\2.png
        IniWrite,%location%,settings.ini,tele_notes,pic
		text = lvl-%lvl% count-%count% , last_match-%last_match%, user-%user%
		Iniwrite,%text%,settings.ini,tele_notes,msg
		sendphoto()
return this
}

sendmsg(m)
{
	Telegram_MsgBox(0,a,text)
	if m = 1
	{
		;IniRead,strings,settings.ini,tele_notes,msg
		IniRead,strings,C:\Users\%A_UserName%\Documents\jatt\settings.ini,tele_notes,msg
		text = %A_UserName% = %strings%
		Telegram_MsgBox(0,a,text)
	}
	else
	{
		send {NumpadSub down}
		Sleep 50
		send {NumpadSub up}
		text = %A_UserName% = %m%
		Telegram_MsgBox(0,a,text)
	}
}
sendmsg_val()
{

	text = height  %A_ScreenHeight%,
}
ping()
{
	bcarray :=[]
	IfInString,A_UserName,2700_1_1
	{
		gudigudi:= ScanSubnet()
		Loop % gudigudi.MaxIndex()
			bcarray.Push(gudigudi[A_Index])

	}
	;scan all active network adapters for active IP's... if no ip's were specified...
	;Msgbox % ScanSubnet("192.168.2.1 192.168.43.1 192.168.56.1")	;find all ip's in the specified address subnets...ex. 192.168.2.(1-255)
	IfInString,A_UserName,2700_1_1
	{
		;loop, Read,\\2700-pc\C\DLL\Users.ini
		;	{
		;		Users.push(A_LoopReadLine) ;
		;	}
		loop , % pc.MaxIndex()
		{
			pc_name := pc[a_Index]
			pc_add = \\%pc_name%\Users
			;RunWait cmdkey /add:%pc_name% /user:%user% /pass:' ,,hide
			if (FileExist(pc_add))
				bcarray.Push(pc_name[A_Index])
			;else
			;this = %this% %pc_name% is dowm %enter%

		}
	}

	;****************** discarded ***********************************************
	IfInString,A_UserName,2700_1_1
	{
		;loop, Read,\\2700-pc\C\DLL\Users.ini
		;	{
		;		Users.push(A_LoopReadLine) ;
		;	}
		loop , % pc.MaxIndex()
		{
			Value := pc[a_Index]
			;IfInString,Value,1
			;{}
			;	else{
			;	Value = %Value%-PC
			OutputDebug %Value% `n
			html := ping_check(Value)
			If html
				bcarray.Push(Value)
			;puser = %puser% %Value% is down %enter%
			;}
		}
		;puser = %puser% %A_UserName% hi ras
		;return puser
		loop % pc.MaxIndex()
		{
			rr := pc[a_index]
			OutputDebug %rr%
			v := HasVal(bcarray,rr)
			OutputDebug v=%v%
			if (v = 0)
				this = %this% %rr% is dowm %enter%
		}
		return this
	}

}
reboot(botToken, msg, from_id, mtext)
{
	Random,rand,2000,3999
	Sleep %rand%
	if (msg.callback_query.id!="")						;  After the user presses a callback button, Telegram clients will display a progress bar until you call answerCallbackQuery
	{
		cbQuery_id := msg.callback_query.id
		; Notification and alert are optional
		url := "https://api.telegram.org/bot" botToken "/answerCallbackQuery?text=Notification&callback_query_id=" cbQuery_id "&show_alert=true"
		json_message := URLDownloadToVar(url)
		;msgbox % json_message
	}
	text := reboot1(mtext)
	if text
		SendText(botToken, text, from_id) ;  url encoding for messages :  %0A = newline (\n)   	%2b = plus sign (+)		%0D for carriage return \r        single Quote ' : %27			%20 = space
}
reboot1(mtext)
{
		IniRead,force_updates,G:/My Drive/file share/val/extra/progress.ini,%A_UserName%,%A_NowUTC%
	if (A_NowUTC - force_updates > 1500)
	{
		IfInString,mtext,all or IfInString,mtext,A_UserName
		{
	IniWrite,%A_NowUTC%,G:/My Drive/file share/val/extra/progress.ini,force_reboot,%A_UserName%
	shutdown,6
			text = %A_UserName% is going down
		}}
		return text
	IfInString,mtext,all
	{
		IfInString,A_UserName,00
		{
			IfInString,mtext,all
				;shutdown,0
			text = %A_UserName% is going down
		}
		else
		{
			;shutdown,6
			text = %A_UserName% is going down
		}
	}
	IfInString,mtext,%A_ComputerName%
	{
		;shutdown,6
		text = %A_UserName% is going down
	}
	IfInString,mtext,%A_UserName%
	{
		;shutdown,0
		text = %A_UserName% is going down
	}
return text
}

ping_check(Server)
{
	FileDelete, Ping.log
	k =
	ServerDown = ; clearing out variable

	;Settimer, ServerCheck, 5000  ; currently set to 5 secs for testing

	;ServerCheck:
	Target = %Server% -n 1 -w 250
	Run, %comspec% /c ping %Target% > Ping.log, , Hide
	Sleep, 350
	FileRead, FileContent, Ping.log
	If FileContent not contains Reply from ; or another error
	{
		;MsgBox, %Server% not responding  ; for testing
		;ServerDown++ ; increments up the timeout count
	}
	Else
	{
		k = 1
		;MsgBox, %Server% is up  ; for testing
		;ServerDown = ; clears the timeout count in case there was any on it
	}
	FileDelete, Ping.log
Return k
}
RunAsAdmin() {
	Global 0
IfEqual, A_IsAdmin, 1, Return 0
Loop, %0%
	params .= A_Space . %A_Index%
DllCall("shell32\ShellExecute" (A_IsUnicode ? "":"A"),uint,0,str,"RunAs",str,(A_IsCompiled ? A_ScriptFullPath
: A_AhkPath),str,(A_IsCompiled ? "": """" . A_ScriptFullPath . """" . A_Space) params,str,A_WorkingDir,int,1)
ExitApp
}
hasVal(haystack, needle) {
	if(!isObject(haystack))
		return false
	if(haystack.Length()==0)
		return false
	for k,v in haystack
		if(v==needle)
		return true
return false
}

hasstringVal(haystack, needle) {
	if(!isObject(haystack))
		return false
	if(haystack.Length()==0)
		return false
	for k,v in haystack
		If InStr(v,needle)
		return true
return false
}
ScanSubnet(addresses:="") {	;pings IP ranges & returns active IP's
	BL := A_BatchLines
	SetBatchLines, -1
	If !addresses{	;scan all active network adapters/connections for active IP's... if no ip's were specified...
		colItems := ComObjGet( "winmgmts:" ).ExecQuery("Select * from Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")._NewEnum
		while colItems[objItem]
			addresses .= addresses ? " " objItem.IPAddress[0] : objItem.IPAddress[0]
	}
	return addresses ; since 2700x is no loger admin we put return
	rVa :=[]
	pcnames :=[]
	Loop, Parse, addresses, % A_Space
	{
		OutputDebug %addresses% `n
		If ( A_LoopField && addrArr := StrSplit(A_LoopField,".") )
			Loop 256
			addr .= addr ? A_Space "or Address = '" addrArr.1 "." addrArr.2 "." addrArr.3 "." A_Index-1 "'" : "Address = '" addrArr.1 "." addrArr.2 "." addrArr.3 "." A_Index-1 "'"
		colPings := ComObjGet( "winmgmts:" ).ExecQuery("Select * From Win32_PingStatus where " addr "")._NewEnum
		While colPings[objStatus]
		{
			rVal:=(oS:=(objStatus.StatusCode="" or objStatus.StatusCode<>0)) ? "" : (rVal ? objStatus.Address : objStatus.Address)
			if rVal
				rVa.Push(rVal)
			else
				break
		}
		addr := ""	;the quota on Win32_PingStatus prevents more than roughtly two ip ranges being scanned simultaneously...so each range is scanned individually.
	}
	SetBatchLines, % BL
	OutputDebug `n
	Loop , % rVa.MaxIndex()
	{
		aa := rVa[A_Index]
		;OutputDebug %aa% `n
		pcnames.push(ReverseLookup(aa))
	}
Return pcnames
}

ReverseLookup(ipaddr)
{
	;OutputDebug %ipaddr% `n
	VarSetCapacity(WSADATA, 394 + (A_PtrSize - 2) + A_PtrSize, 0)
	if (DllCall("ws2_32\WSAStartup", "ushort", 0x0202, "ptr", &WSADATA) != 0)
		return "WSAStartup failed", DllCall("ws2_32\WSACleanup")

	inaddr := DllCall("ws2_32\inet_addr", "astr", ipaddr, "uint")
	if !(inaddr) || (inaddr = 0xFFFFFFFF)
		return "inet_addr failed", DllCall("ws2_32\WSACleanup")

	size := VarSetCapacity(sockaddr, 16, 0), NumPut(2, sockaddr, 0, "short") && NumPut(inaddr, sockaddr, 4, "uint")
	VarSetCapacity(hostname, 1025 * (A_IsUnicode ? 2 : 1))
	if (DllCall("ws2_32\getnameinfo", "ptr", &sockaddr, "int", size, "ptr", &hostname, "uint", 1025, "ptr", 0, "uint", 32, "int", 0))
		return "getnameinfo failed with error: " DllCall("ws2_32\WSAGetLastError"), DllCall("ws2_32\WSACleanup")
return StrGet(&hostname+0, 1025, "cp0"), DllCall("ws2_32\WSACleanup")
}

; end of auto-execute section; the rest of the script are re-usable library functions
;----------------------------------------------------------------------------------------------------------------------------------
SendPhoto2(token, chatID, file, caption := "" )		; you could add more options; compare the Telegram API docs
{
	url_str := "https://api.telegram.org/bot" token "/sendPhoto?caption=" caption
	objParam := {	 	"chat_id" : chatID
	, 	"photo" : [file] }
return UploadFormData(url_str, objParam)
}
;---------------------------------------------
UploadFormData(url_str, objParam)									; Upload multipart/form-data
{
	CreateFormData(postData, hdr_ContentType, objParam)
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("POST", url_str, true)
	whr.SetRequestHeader("Content-Type", hdr_ContentType)
	; whr.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko")				; ???????
	whr.Option(6) := False ; No auto redirect
	whr.Send(postData)
	try
	whr.WaitForResponse()
	json_resp := whr.ResponseText
	whr :=												; free COM object
return json_resp							; will return a JSON string that contains, among many other things, the file_id of the uploaded file
}
;###################################################################################################################
/*
	CreateFormData - Creates "multipart/form-data" for http post

	Usage: CreateFormData(ByRef retData, ByRef retHeader, objParam)

		retData   - (out) Data used for HTTP POST.
		retHeader - (out) Content-Type header used for HTTP POST.
		objParam  - (in)  An object defines the form parameters.

		            To specify files, use array as the value. Example:
		                objParam := { "key1": "value1"
		                            , "upload[]": ["1.png", "2.png"] }

	Requirement: BinArr.ahk -- https://gist.github.com/tmplinshi/a97d9a99b9aa5a65fd20
	Version    : 1.20 / 2016-6-17 - Added CreateFormData_WinInet(), which can be used for VxE's HTTPRequest().
	             1.10 / 2015-6-23 - Fixed a bug
	             1.00 / 2015-5-14
*/

; Used for WinHttp.WinHttpRequest.5.1, Msxml2.XMLHTTP ...
CreateFormData(ByRef retData, ByRef retHeader, objParam) {
	New CreateFormData(retData, retHeader, objParam)
}

; Used for WinInet
CreateFormData_WinInet(ByRef retData, ByRef retHeader, objParam) {
	New CreateFormData(safeArr, retHeader, objParam)

	size := safeArr.MaxIndex() + 1
	VarSetCapacity(retData, size, 1)
	DllCall("oleaut32\SafeArrayAccessData", "ptr", ComObjValue(safeArr), "ptr*", pdata)
	DllCall("RtlMoveMemory", "ptr", &retData, "ptr", pdata, "ptr", size)
	DllCall("oleaut32\SafeArrayUnaccessData", "ptr", ComObjValue(safeArr))
}

Class CreateFormData {

	__New(ByRef retData, ByRef retHeader, objParam) {

		CRLF := "`r`n"

		Boundary := this.RandomBoundary()
		BoundaryLine := "------------------------------" . Boundary

		; Loop input paramters
		binArrs := []
		For k, v in objParam
		{
			If IsObject(v) {
				For i, FileName in v
				{
					str := BoundaryLine . CRLF
					. "Content-Disposition: form-data; name=""" . k . """; filename=""" . FileName . """" . CRLF
					. "Content-Type: " . this.MimeType(FileName) . CRLF . CRLF
					binArrs.Push( BinArr_FromString(str) )
					binArrs.Push( BinArr_FromFile(FileName) )
					binArrs.Push( BinArr_FromString(CRLF) )
				}
			} Else {
				str := BoundaryLine . CRLF
				. "Content-Disposition: form-data; name=""" . k """" . CRLF . CRLF
				. v . CRLF
				binArrs.Push( BinArr_FromString(str) )
			}
		}

		str := BoundaryLine . "--" . CRLF
		binArrs.Push( BinArr_FromString(str) )

		retData := BinArr_Join(binArrs*)
		retHeader := "multipart/form-data; boundary=----------------------------" . Boundary
	}

	RandomBoundary() {
		str := "0|1|2|3|4|5|6|7|8|9|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z"
		Sort, str, D| Random
		str := StrReplace(str, "|")
		Return SubStr(str, 1, 12)
	}

	MimeType(FileName) {
		n := FileOpen(FileName, "r").ReadUInt()
		Return (n = 0x474E5089) ? "image/png"
		: (n = 0x38464947) ? "image/gif"
		: (n&0xFFFF = 0x4D42 ) ? "image/bmp"
		: (n&0xFFFF = 0xD8FF ) ? "image/jpeg"
		: (n&0xFFFF = 0x4949 ) ? "image/tiff"
		: (n&0xFFFF = 0x4D4D ) ? "image/tiff"
		: "application/octet-stream"
	}

}
;#############################################################################################################
; Update: 2015-6-4 - Added BinArr_ToFile()

BinArr_FromString(str) {
	oADO := ComObjCreate("ADODB.Stream")

	oADO.Type := 2 ; adTypeText
	oADO.Mode := 3 ; adModeReadWrite
	oADO.Open
	oADO.Charset := "UTF-8"
	oADO.WriteText(str)

	oADO.Position := 0
	oADO.Type := 1 ; adTypeBinary
	oADO.Position := 3 ; Skip UTF-8 BOM
return oADO.Read, oADO.Close
}

BinArr_FromFile(FileName) {
	oADO := ComObjCreate("ADODB.Stream")

	oADO.Type := 1 ; adTypeBinary
	oADO.Open
	oADO.LoadFromFile(FileName)
return oADO.Read, oADO.Close
}

BinArr_Join(Arrays*) {
	oADO := ComObjCreate("ADODB.Stream")

	oADO.Type := 1 ; adTypeBinary
	oADO.Mode := 3 ; adModeReadWrite
	oADO.Open
	For i, arr in Arrays
		oADO.Write(arr)
	oADO.Position := 0
return oADO.Read, oADO.Close
}

BinArr_ToString(BinArr, Encoding := "UTF-8") {
	oADO := ComObjCreate("ADODB.Stream")

	oADO.Type := 1 ; adTypeBinary
	oADO.Mode := 3 ; adModeReadWrite
	oADO.Open
	oADO.Write(BinArr)

	oADO.Position := 0
	oADO.Type := 2 ; adTypeText
	oADO.Charset := Encoding
return oADO.ReadText, oADO.Close
}

BinArr_ToFile(BinArr, FileName) {
	oADO := ComObjCreate("ADODB.Stream")

	oADO.Type := 1 ; adTypeBinary
	oADO.Open
	oADO.Write(BinArr)
	oADO.SaveToFile(FileName, 2)
	oADO.Close
}

/*

RandomVariable = sting with variable: %A_OSType%

no := GetUpdates()
OutputDebug %no%
Pause

Telegram_MsgBox(16,1,"string") 						;icon before text
Telegram_MsgBox(32,2,RandomVariable) 				;icon after text
Telegram_MsgBox("%F0%9F%8E%88",2,RandomVariable) 	;own icon
Telegram_MsgBox(0,a,"string with space")			;no icon
*/
Telegram_MsgBox(Option,EmojiPosition,Text)
{
	TelegramBotToken =
	TelegramBotChatID =

	if Option=16
		TelegramIconString := "%E2%9D%8C"
	if Option=32
		TelegramIconString := "%E2%9D%94"
	if Option=48
		TelegramIconString := "%E2%9A%A0%EF%B8%8F"
	if Option=64
		TelegramIconString := "%E2%84%B9%EF%B8%8F"

	IfInString, Option, `%
		TelegramIconString := Option

	IfLessOrEqual, EmojiPosition, 1
	Text = %TelegramIconString% %Text%

	IfGreaterOrEqual, EmojiPosition, 2
	Text = %Text% %TelegramIconString%

	loop 3
	{
		UrlDownloadToFile https://api.telegram.org/bot%TelegramBotToken%/sendmessage?chat_id=%TelegramBotChatID%&text=%Text%, %A_ScriptDir%\check.rups
		sleep 1000
		ifexist %A_ScriptDir%\check.rups
		{
			break
		}
		if A_index = 3
		{
			;MsgBox, 16,, something went wrong with sending
		}
	}
	filedelete %A_ScriptDir%\check.rups
}
