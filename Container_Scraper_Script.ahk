!C::
MBLtoScrape := clipboard
clipboard := ""
run, %comspec% /k ,,,pid1
WinWaitActive, %ComSpec% ahk_pid %PID1%
WinHide
Sleep, 300
SENDINPUT python C:\Users\DOCS\Desktop\Carriers\app.py %MBLtoScrape%
SENDEVENT, {enter}
RETURN
