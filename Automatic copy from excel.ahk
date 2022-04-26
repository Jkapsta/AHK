; Start full screen with manager on tab 1 and excel tab 2
; Excel should be completed with "end" at stop points
; Microsoft Edge, 100% screen

^+!e::

InputBox, loopcount ,, How many products?
Loop %loopcount% {; How many products?
Send ^c ; copy product name
    If (Clipboard = )
    Return
Send ^1 ; manager
Click, 315 278; product search
Send ^v ; paste product name
Send ^2 ; go to excel
Send {Right} ; category row
Send ^c ; copy category name
Send ^1 ; go to manager
Click, 1837 398 ; three dots
SLeep 200
Click, 1792 428 ; edit

PixelGetColor, color, 1280, 850 ; wait for search to complete
While !(color = "0xFFFFFF")
PixelGetColor, color, 1280, 850

Send {Tab 10} ; navigate to category field
Send ^v ; paste category name
Send {Enter} ; apply category
Send {Tab 6} ; go to Update
Send {Enter} ; Update

PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

Click, 1746 396 ; manage extras
Sleep 200
PixelGetColor, color, 1670 , 310 ; check if product has extras
If (color = #fbf0de) {
    Loop 10 { ; delete existing extra groups
        Click, 1670 310 ; trashcan
        Click, 1784 405 ; OK
        }
    addextra: ; add extras one by one
        Loop 10 {
            Send ^2 ; excel
            Send {Right} ; next extra group
            Send ^c ; copy extra group name
                If (Clipboard = ) {
                    Send {Esc}
                    Break addextra ; end adding extras
                    }
            Send ^1 ; Manager
            Click, 996 175 ; extra group search
            Send, ^v ; paste extra group name
            Send, {Enter} ; apply extra group name
            Send, {Tab} ; go to Add existing extra group
            Send, {Enter} ; Add existing extra group
                }
            }
    else {
        Send {Esc}
    }

Click 315 278 ; search bar
Send ^a ; select all text in search
Send {Backspace} ; delete text in search bar
Send ^2 ; excel
Send ^{Left} ; far left row
Send {Down} ; next product

}
Return

F8::
Suspend
Pause,, 1
Return