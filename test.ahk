#SingleInstance, Force
#IfWinActive ahk_class Chrome_WidgetWin_1
+lx::

Setkeydelay, 100
Click, X, Y, 3
Send, ^c
Send, !{Tab}
Send, ^f 
Send, ^v
Send, {Enter}
Send, !{Tab}
Return