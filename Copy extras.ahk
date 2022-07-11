#SingleInstance, Force
SetKeyDelay 100

+z::
Send, ^1 ; Manager
Click 1827 205 ; Create
Send, ^2
Loop {
    Send, ^c
        If (Clipboard = "end")
        {
            Return
        }
    Send, ^1
    Sendinput, {Tab 2}
    Send, ^v ; paste estonian name
    Loop 2 
    { 
        Send, ^2 ;excel
        Send, {Right} ; next translation
        Send, ^c ; copy name
        Send, ^1 ; manager
        Send, {Tab} ; next row
        Send, ^v
    }
    Sendinput, {Tab 3}
    Send, {Enter}

    PixelGetColor, color, 100, 600 ; wait for update to end
    While !(color = "0xFFFFFF")
    PixelGetColor, color, 100, 600

    Send, {Enter}
    Send, ^2
    Send, ^{Left}
    Send, {Down}
}
Return

F1::
SetKeyDelay, 90
Send, {Tab}
Loop 3
{
Send, {Tab}
Send, ^c
Send, ^2
Send, ^v
Send, {Right}
Send, ^1
}
Send, {Esc}
Send, ^2
Sleep 100
Send, ^{Left 2}
Send, {Down}
Send, ^1
Return

F2::
SetKeyDelay, 100
Sendinput, {Tab 2}
Loop 3 {
Send, ^c
Send, ^2
Send, ^v
Send, {Right}
Send, ^1
Send, {Tab}
}
Send, ^2
Send, ^{Left 2}
Send, {Down}
Send, ^1
Send, {Esc}
Return


F8::
Suspend
Pause,, 1
Return