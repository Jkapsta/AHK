#SingleInstance, Force

+1:: ; add product one by one
SetKeyDelay 90
Send, {Tab 2}
Send, ^2
Loop 3 { ; 7 if no discount 8 if discount
    Send, ^c
    Send, ^1
    Send, ^v
    Send, {Tab}
    Send, ^2
    Send, {Right}
}
Loop 0 { ; 7 if no discount 8 if discount
    Send, ^c
    Send, ^1
    Send, ^v
    Send, {Backspace}
    Sendinput, ^{Up 4}
    Send, {Delete}
    Send, {Tab}
    Send, ^2
    Send, {Right}
}
Send, {right 3}
Send, ^1
Send, {Tab}
Send, ^2
Loop 2 {
    Send, ^c
    Send, ^1
    Send, ^v
    Send, {Tab}
    Send, ^2
    Send, {Right}
}
Send, ^c
Send, ^{Left}
Send, {Down}
Send, ^1
; Send, {Tab}
Send, ^v
Send, {Down}
Send, {Enter}
Send, {Tab 2}
Send {Enter}
Return

+2:: ; return back to A1
SetKeyDelay 100
Sleep 200
Send, ^2
Send, ^{Left}
Send, ^{Up 2}
Send ^1
Return

+0::
SetKeyDelay, 100
Loop 3 {
Send, ^3
Send, ^c
Send, {Right}
Send, ^1
Send, {Tab}
Send, ^v
}
Send, ^3
Send, ^{Left 2}
Send, ^1
Return

F1:: ; fill product from manager
SetKeyDelay, 100
Sendinput, {Tab 2}
    Send, ^c
    Send, ^2
    Send, ^v
    Send, ^1
Loop 2 {
    Send, {Tab}
    Send, ^c
    Send, ^2
    Send, {Right}
    Send, ^v
    Send, ^1
}
Loop 4 {
    Send, {Tab}
    Send, ^a
    Send, ^c
    Send, ^2
    Send, {Right}
    Send, ^v
    Send, ^1
}
Send, ^2
Send, {Right}
Sendinput, INSERT CATEGORY HERE
Send, ^{Left}
Send, {Down}
Return

F2::

Return


