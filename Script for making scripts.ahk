#SingleInstance, Force
Setkeydelay 90

; Lets call this one script for making scripts

F1::
MouseGetPos, x, y
clipboard := x y
Return

F2::
Sendinput, {Enter}
Sendinput, Click,
Sendinput, {Space}
Sendinput, %x%
Sendinput, {space}
Sendinput, %y%
Return

