;initialization
Hotkey, *~$Space, Off
Hotkey, *~$MButton, Off
Hotkey, *~$t, Off

;Recoil weapon switch system
loop
{
GetKeyState, state, F4
if state = D
{
ak:=true
m4a1:=false
m4a4:=false
famas:=false
galil:=false
ump:=false
}

GetKeyState, state, F6
if state = D
{
m4a1:=true
ak:=false
m4a4:=false
famas:=false
galil:=false
ump:=false
}

GetKeyState, state, F7
if state = D
{
m4a4:=true
ak:=false
m4a1:=false
famas:=false
galil:=false
ump:=false
}

GetKeyState, state, F8
if state = D
{
famas:=true
ak:=false
m4a1:=false
m4a4:=false
galil:=false
ump:=false
}

GetKeyState, state, F9
if state = D
{
galil:=true
ak:=false
m4a1:=false
m4a4:=false
famas:=false
ump:=false
}

GetKeyState, state, F10
if state = D
{
ExitApp
}

GetKeyState, state, F11
if state = D
{
ak:=false
m4a1:=false
m4a4:=false
famas:=false
galil:=false
ump:=false
}

GetKeyState, state, F12
if state = D
{
ump:=true
ak:=false
m4a1:=false
m4a4:=false
famas:=false
galil:=false
}
}



;Bunnyhop
F1:: Hotkey, *~$Space, Toggle
*~$Space::
sleep 5
loop
{
    GetKeyState, SpaceState, Space, P
    if SpaceState = U
        break 
    Sleep 1
    Send, {Blind}{Space}
}
Return



;Rapid fire
F2:: Hotkey, *~$MButton, Toggle
*~$MButton::
sleep 10
loop
{
    GetKeyState, state, MButton
    if state = U
        break 
    Sleep 1
    Send, {Blind}{LButton}
}
Return



;180 Turnaround
F3:: Hotkey, *~$t, Toggle
*~$t::
DllCall("mouse_event", "UInt", 0x01, "UInt", 223, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 1
DllCall("mouse_event", "UInt", 0x01, "UInt", 432, "UInt", 0)
sleep 200



;RCS
*~$LButton::
;AK-47
while ak==true && GetKeyState("LButton")
{
sleep 50
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 7)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", 19)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -3, "UInt", 29)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 31)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 13, "UInt", 31)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 8, "UInt", 28)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 13, "UInt", 21)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -17, "UInt", 12)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -42, "UInt", -3)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -21, "UInt", 2)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 12, "UInt", 11)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -15, "UInt", 7)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -26, "UInt", -8)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -3, "UInt", 4)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 40, "UInt", 1)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 19, "UInt", 7)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 14, "UInt", 10)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 27, "UInt", 0)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 33, "UInt", -10)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -21, "UInt", -2)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 7, "UInt", 3)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -7, "UInt", 9)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -8, "UInt", 4)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 19, "UInt", -3)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 5, "UInt", 6)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -20, "UInt", -1)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -33, "UInt", -4)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -45, "UInt", -21)
sleep 99
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -14, "UInt", 1)
GetKeyState, state, LButton
if state = U
break
sleep 2000
GetKeyState, state, LButton
if state = U
break
}
;M4A1
while m4a1==true && GetKeyState("LButton")
{
sleep 15
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 6)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 4)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 14)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", 18)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -6, "UInt", 21)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 24)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 14, "UInt", 14)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 8, "UInt", 12)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 18, "UInt", 5)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 10)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -14, "UInt", 5)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -25, "UInt", -3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -19, "UInt", 0)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -22, "UInt", -3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 8, "UInt", 3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -9, "UInt", 1)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -13, "UInt", -2)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 3, "UInt", 2)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 1)
sleep 88
GetKeyState, state, LButton
if state = U
break
sleep 2000
GetKeyState, state, LButton
if state = U
break
}
;M4A4
while m4a4==true && GetKeyState("LButton")
{
sleep 15
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 2, "UInt", 7)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 9)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -6, "UInt", 16)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 7, "UInt", 21)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -9, "UInt", 23)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -5, "UInt", 27)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 16, "UInt", 15)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 11, "UInt", 13)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 22, "UInt", 5)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 11)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -18, "UInt", 6)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -30, "UInt", -4)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -24, "UInt", 0)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -25, "UInt", -6)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 4)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 8, "UInt", 4)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -11, "UInt", 1)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -13, "UInt", -2)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 2, "UInt", 2)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 33, "UInt", -1)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 10, "UInt", 6)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 27, "UInt", 3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 10, "UInt", 2)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 11, "UInt", 0)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -12, "UInt", 0)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 6, "UInt", 5)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", 5)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 3, "UInt", 1)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", -1)
GetKeyState, state, LButton
if state = U
break
sleep 2000
GetKeyState, state, LButton
if state = U
break
}
;Famas
while famas==true && GetKeyState("LButton")
{
sleep 30
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 5)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 4)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -6, "UInt", 10)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 17)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 20)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 14, "UInt", 18)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 16, "UInt", 12)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -6, "UInt", 12)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -20, "UInt", 8)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -16, "UInt", 5)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -13, "UInt", 2)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", 5)
sleep 87
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 23, "UInt", 4)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 12, "UInt", 6)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 20, "UInt", -3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 5, "UInt", 0)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 15, "UInt", 0)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 3, "UInt", 5)
sleep 80
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 3)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -25, "UInt", -1)
sleep 80
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -3, "UInt", 2)
sleep 84
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 11, "UInt", 0)
sleep 80
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 15, "UInt", -7)
sleep 88
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 15, "UInt", -10)
sleep 88
GetKeyState, state, LButton
if state = U
break
sleep 2000
GetKeyState, state, LButton
if state = U
break
}
;Galil
while galil==true && GetKeyState("LButton")
{
sleep 10
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", 4)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -2, "UInt", 5)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 6, "UInt", 10)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 12, "UInt", 15)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 21)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 2, "UInt", 24)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 6, "UInt", 16)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 11, "UInt", 10)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 14)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -22, "UInt", 8)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -30, "UInt", -3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -29, "UInt", -13)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -9, "UInt", 8)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -12, "UInt", 2)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -7, "UInt", 1)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 1)
sleep 50
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 4, "UInt", 7)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 25, "UInt", 7)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 14, "UInt", 4)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 25, "UInt", -3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 31, "UInt", -9)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 6, "UInt", 3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -12, "UInt", 3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 13, "UInt", -1)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 10, "UInt", -1)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 16, "UInt", -4)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -9, "UInt", 5)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -32, "UInt", -5)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -24, "UInt", -3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -15, "UInt", 5)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 6, "UInt", 8)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -14, "UInt", -3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -24, "UInt", -14)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -13, "UInt", -1)
sleep 90
GetKeyState, state, LButton
if state = U
break
sleep 2000
GetKeyState, state, LButton
if state = U
break
}
;UMP45
while ump==true && GetKeyState("LButton")
{
sleep 15
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 6)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 8)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -2, "UInt", 18)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 23)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -9, "UInt", 23)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -3, "UInt", 26)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 11, "UInt", 17)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -4, "UInt", 12)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 9, "UInt", 13)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 18, "UInt", 8)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 15, "UInt", 5)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 5, "UInt", 6)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 6)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 9, "UInt", -3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 5, "UInt", -1)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -12, "UInt", 4)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -19, "UInt", 1)
sleep 85
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", -2)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 15, "UInt", -5)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", 17, "UInt", -2)
sleep 85
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -6, "UInt", 3)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -20, "UInt", -2)
sleep 90
GetKeyState, state, LButton
if state = U
break
DllCall("mouse_event", "UInt", 0x01, "UInt", -3, "UInt", -1)
sleep 90
GetKeyState, state, LButton
if state = U
break
sleep 2000
GetKeyState, state, LButton
if state = U
break
}