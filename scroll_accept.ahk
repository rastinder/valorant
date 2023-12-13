
Loop, 1
{

SetTitleMatchMode, 2
CoordMode, Mouse, Screen

tt = Riot Client Main ahk_class RCLIENT
WinWait, %tt%
IfWinNotActive, %tt%,, WinActivate, %tt%

Sleep, 162

MouseClick, L, 1208, 235,,, D

Sleep, 969

MouseClick, L, 1221, 680,,, U

Sleep, 586

MouseClick, L, 869, 838

Sleep, 1656

MouseClick, L, 421, 910

Sleep, 164


Sleep, 1000

}
