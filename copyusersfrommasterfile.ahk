#include <tf> 
;location = G:\My Drive\file share\val\masterusername.csv
location = masterusername.csv
RunWait,downloadsheet.exe
file_write = !%location%
IniWrite,%A_NowUTC%,G:/My Drive/file share/val/extra/progress.ini,last_active,%A_UserName%
word_array:=[]
set_user:=[]
global acc_perpc
acc_perpc = 8
acc_perpc++
;RunAsAdmin()
IniRead,lvl,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,lvl
IniRead,ReadLine,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
word_array := StrSplit(ReadLine, A_Tab )
compelted_acc := word_array[1]
if (lvl = 20 or instr(lvl,"no_tut") or instr(lvl,"wrong_pass") or instr(lvl,"err"))
{
    IniWrite,0,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,lvl
    OutputDebug lvl %lvl%
}
papaloop:=[0,5,10,15]

Loop, Read,%location%
    total_accs:= A_Index
loop,% papaloop.MaxIndex()
{
    papa_value:= papaloop[A_Index]
    papa_value += 0
    target_lvl := papa_value + 5
    OutputDebug papa_value=%papa_value% target_lvl=%target_lvl% lvl-%lvl% `n
    Loop,% total_accs
    {
        FileReadLine,ReadLine,%location%,%A_Index%
        word_array := StrSplit(ReadLine, "," )

        worker :=word_array[3]
        workerx:=worker
        if instr(worker,"xx")
        {
            worker:=StrSplit(worker,"xx")
            ,worker:=worker[1]
        }
         if a_index = 30
            OutputDebug `n %A_Index% %ReadLine% - %worker%
        if (instr(ReadLine,compelted_acc) and !instr(lvl,"ERROR") and lvl != 0)
        {
            user :=word_array[1]
            ,pass :=word_array[2]
            ,progres:=word_array[4]
            if lvl = progres
                ExitApp1()
            index1 = %A_Index%
            if lvl between 1 and 20
            {
                str = %user%,%pass%,%A_UserName%,%lvl%,,active
                str1 = %user%,%pass%,%A_UserName%,%lvl%
                OutputDebug `n %A_Index% %str%
                TF_ReplaceLine1(file_write,index1,index1,str)
            }
            else
            {
                str = %user%,%pass%,%workerx%,%progres%,%lvl%
                OutputDebug `n %A_Index% %str%
                TF_ReplaceLine1(file_write,index1,index1,str)
                kill_epic()
                ExitApp1()
            }
            if (lvl >= target_lvl)
            {

                kill_me := target_lvl
            }
        }
        else if (worker == A_UserName)
        {
            progres:=word_array[4]
            ,anyerror:=word_array[5]
            ;OutputDebug csv_lvl=%progres%
            if !(anyerror == "err" or progres = 20 or anyerror == "wrong_pass" or anyerror == "no_tut")
            {
                set_user.Push(ReadLine)
                OutputDebug % set_user.maxindex()
                if (set_user.maxindex() = acc_perpc)
                    break 
                ;progres+=0
                if (progres < target_lvl)
                {
                    if kill_me = target_lvl
                    {
                        TF_ReplaceLine1(file_write,index1,index1,str1)
                        kill_epic()
                        Break
                    }
                    Else if (kill_me < target_lvl and kill_me)
                        ExitApp1()
                    user :=word_array[1]
                    ,pass :=word_array[2]
                    str = %user%,%pass%,%A_UserName%,%progres%,,active
                    OutputDebug `n %A_Index% %str%
                    index = %A_Index%
                    TF_ReplaceLine1(file_write,index,index,str)
                    ReadLine =%user%	%pass%
                    IniWrite,%ReadLine%,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
                    Sleep 200
                    ExitApp1()
                }
            }
        }
        else if !worker
        {
            user :=word_array[1]
            ,pass :=word_array[2]
            str = %user%,%pass%,%A_UserName%,0,,active
            OutputDebug `n %A_Index% %str%
            index = %A_Index%
            TF_ReplaceLine1(file_write,index,index,str)
            ReadLine =%user%	%pass%
            IniWrite,%ReadLine%,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
            Sleep 200
            if str1
                TF_ReplaceLine1(file_write,index1,index1,str1)
            ExitApp1()
        }
    }
    set_user:=[]
} ;papa loop
;........................................... the end ...............................
;................................error wale acc run kro.......................
workers:=[]
Loop,% total_accs
{
    FileReadLine,ReadLine,%location%,%A_Index%
    word_array := StrSplit(ReadLine, "," )

    worker :=word_array[3]
    ,anyerror:=word_array[5]
   ; if instr(worker,"xx")
    ;{
     ;   worker:=StrSplit(worker,"xx")
      ;  ,worker:=worker[1]
    ;}
    OutputDebug `n %A_Index% %ReadLine% - lvl=%progres%
    if (anyerror == "err") ;or anyerror == "wrong_pass")
    {
        workers:=StrSplit(worker,"xx")
        ,workered:=workers[2]
        OutputDebug % workered
        if !workered
            workered = 1
        if (workered <= 3)
        {
            workered++
            user :=word_array[1]
            ,pass :=word_array[2]
            ,Progress :=word_array[4]
            ReadLine =%user%	%pass%
            str = %user%,%pass%,%A_UserName%xx%workered%,%Progress% ; j chkr pe reha tan ethe lvl wich 0 likh do
            index = %A_Index%
            TF_ReplaceLine1(file_write,index,index,str)
            IniWrite,%ReadLine%,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
            Sleep 200
            if str1
                TF_ReplaceLine1(file_write,index1,index1,str1)
            ExitApp1()
        }
    }
}
;..............................error wale acc run kro ends................
;.................load balancing non active koi v chak lo................
loop,% papaloop.MaxIndex()
{
    papa_value:= papaloop[A_Index]
    papa_value += 0
    target_lvl := papa_value + 5
    OutputDebug papa_value=%papa_value% target_lvl=%target_lvl% lvl-%lvl% `n
    Loop,% total_accs
    {
        FileReadLine,ReadLine,%location%,%A_Index%
        word_array := StrSplit(ReadLine, "," )
        ,active_status :=word_array[6]
        ,progres:=word_array[4]
        ,anyerror:=word_array[5]
        OutputDebug `n csv_lvl=%progres%
        if !(anyerror == "err" or progres = 20 or anyerror == "wrong_pass" or anyerror == "no_tut" or active_status == "active")
        {
            ;progres+=0
            if (progres < target_lvl)
            {
                user :=word_array[1]
                ,pass :=word_array[2]
                str = %user%,%pass%,%A_UserName%,%progres%,,active
                OutputDebug `n %A_Index% %str%
                index = %A_Index%
                TF_ReplaceLine1(file_write,index,index,str)
                ReadLine =%user%	%pass%
                IniWrite,%ReadLine%,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
                Sleep 200
                if str1
                    TF_ReplaceLine1(file_write,index1,index1,str1)
                ExitApp1()
            }
        }

    }
    set_user.RemoveAll()
}
;.................load balancing non active koi v chak lo ends................
;.................load balancing v2 active v chak lo ................
IniRead,pc_users,G:\My Drive\file share\val\extra\progress.Ini,last_active
pc_users := StrSplit(pc_users,"`n")
sorttick:=[]
loop,% pc_users.MaxIndex()
{
    
    current_user:=pc_users[A_Index]
    ,ticks:= StrSplit(current_user,"=")
    ticks:= ticks[2]
    sorttick.Push(ticks)
}
sort,sorttick,N
loop,% pc_users.MaxIndex()
{
    uswr:=pc_users[A_Index]
    ticks:=sorttick[A_Index]
    if instr(uswr,ticks)
    {
        if (A_NowUTC - ticks > 28800000)
        {
            user:=pc_users[1]
            Loop,% total_accs
            {
                FileReadLine,ReadLine,%location%,%A_Index%
                word_array := StrSplit(ReadLine, "," )
                worker:=word_array[3]
                if instr(worker,"xx")
                {
                    worker:=StrSplit(worker,"xx")
                    ,worker:=worker[1]
                }
                progres:=word_array[4]
                ,anyerror:=word_array[5]
                OutputDebug csv_lvl=%progres%
                if !(anyerror == "err" or progres = 20 or anyerror == "wrong_pass" or anyerror == "no_tut" ) and (worker = user)
                {
                    ;progres+=0
                    user :=word_array[1]
                    ,pass :=word_array[2]
                    str = %user%,%pass%,%A_UserName%,%progres%,,active
                    OutputDebug `n %A_Index% %str%
                    index = %A_Index%
                    TF_ReplaceLine1(file_write,index,index,str)
                    ReadLine =%user%	%pass%
                    IniWrite,%ReadLine%,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
                    Sleep 200
                    if str1
                        TF_ReplaceLine1(file_write,index1,index1,str1)
                    ExitApp1()
                }
            }
        }
    }
}

;.................load balancing v2 active v chak lo ends ................



TF_ReplaceLine1(file_write,index,index1,str)
{
        word_array := StrSplit(str, "," )
        ,user :=word_array[1]
        ,pass :=word_array[2]
        ,worker :=word_array[3]
        ,lvl :=word_array[4]
        ,errname :=word_array[5]
        ,isactive :=word_array[6]
    IniWrite,%user%,sheetvalues.ini, values,user
    IniWrite,%pass%,sheetvalues.ini,values,pass
    IniWrite,%worker%,sheetvalues.ini,values,owner
    IniWrite,%lvl%,sheetvalues.ini,values,lvl
    IniWrite,%errname%,sheetvalues.ini,values,errname
    IniWrite,%isactive%,sheetvalues.ini,values,isactive
    IniWrite,%index%,sheetvalues.ini,values,line
    Loop {
            process, exist, editsheet.exe
            sleep, 500
        } until !errorlevel 
    Run, editsheet.exe
    
    /*
    ; old method
    if ping(server)
    {
        IniRead,file_in_use,%b%\extras\access_req.ini,what
        while (file_in_use !=0)
            IniRead,file_in_use,%b%\extras\access_req.ini,by 
        IniWrite,1,%b%\extras\pc\%a_username%\access_req.ini,what,access_req
        while (file_in_use !=A_UserName)
         IniRead,file_in_use,%b%\extras\access_req.ini,what
    }
    TF_ReplaceLine(file_write,index,index,str)
    IniWrite,0,%b%\extras\pc\%a_username%\access_req.ini,what,access_req
    */
}
ExitApp1()
{
        FileDelete, masterusername.csv
        ExitApp
}
ping_check(server = 0)
{
if (server = 0)
Server = www.google.co.in  ; network server nam
Target = %Server% -n 1 -w 250 
RunWait, %comspec% /c ping %Target% > Ping.log, , Hide
Sleep, 50
FileRead, FileContent, Ping.log 
If FileContent not contains Reply from ; or another error 
{
}
Else
{
  k = 1
  ;MsgBox, %Server% is up 
}
FileDelete, Ping.log
Return k
}

IniDelete,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
kill_epic()
{
    RunWait Taskkill /IM VALORANT-Win64-Shipping.exe /F ,,hide
    RunWait Taskkill /IM VALORANT.exe /F ,,hide
    RunWait Taskkill /IM UnrealCEFSubProcess.exe /F ,,hide
    RunWait Taskkill /IM RiotClientUx.exe /F ,,hide
    RunWait Taskkill /IM RiotClientServices /F ,,hide
    IniDelete,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,user
    IniDelete,c:\Users\%A_Username%\Documents\jatt\settings.ini,user,lvl
}

RunAsAdmin() {
    Global 0
    IfEqual, A_IsAdmin, 1, Return 0
    Loop, %0%
        params .= A_Space . %A_Index%
    DllCall("shell32\ShellExecute" (A_IsUnicode ? "":"A"),uint,0,str,"RunAs",str,(A_IsCompiled ? A_ScriptFullPath
    : A_AhkPath),str,(A_IsCompiled ? "": """" . A_ScriptFullPath . """" . A_Space) params,str,A_WorkingDir,int,1)
    ExitApp1()
}