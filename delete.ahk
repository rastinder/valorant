RunWait,ipconfig, OutputVar, hide
OutputVar = A_IPAddress2
OutputVar = A_IPAddress3
OutputVar = A_IPAddress4
OutputVar = A_IPAddress5
loop,files,C:\Windows\Cursors\*.cur
{
ImageSearch,xx,yy,0,0,1920,1080,%A_LoopFileFullPath% *Icon3
OutputDebug %ErrorLevel%
    If ErrorLevel
    {
    }
    Else
    {
        ; Cursor file found
        OutputDebug, Cursor file found at coordinates (%IconX%, %IconY%): %A_LoopFileFullPath%
    }
}