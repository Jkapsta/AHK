; Start full screen with manager on tab 1 and excel tab 2
; Excel should be completed with "end" at stop points
; Microsoft Edge, 100% screen


#SingleInstance, force
#NoEnv

+z::

SetKeyDelay, 170

Loop
{ 
Send ^c ; copy product name
    If (Clipboard = "end" ) ; end of the road!!!
    Return
Send ^1 ; manager
Click, 315 278 ; product search
Send ^a ; select all text in search
; Send {Backspace} ; delete text in search bar
Send ^v ; paste product name
Send, ^2 ; go to excel
Send, {Right 2} ; extra group row
Send ^c ; copy extra group name
Send, {Left}
Send ^1 ; go to manager
If (Clipboard = "end" ) ; no extras
    Goto, goback

; Searchfinish:
; Loop { ; Check if search has finished
; PixelGetColor, color, 484, 333
;if (color = 0xFAFAE6)
;{
;     Sleep 100
; }
; Elseif (color = 0xFAFAFA)
; {
; Break Searchfinish
; }
; }
Sleep 700
PixelGetColor, color, 1114, 510 ; check if there are more than one product
    If (Color = 0xFFFFFF )
    {
        Input, user, L1 ; click on 1 ; 2 ; 3 to select which product is the right one
        If (user = 1) ; first product
        {    
            Click, 1745 400 ; Manage extras
        }
        If (user = 2) ; second product
        {    
            Click, 1745 461 ; Manage extras
        }
        If (user = 3) ; third product
        {    
            Click, 1745 529 ; Manage extras
        }
    }

    Else
    {
        Click, 1745 400 ; Manage extras
    }
Sleep 600
    addextra: ; add extras one by one
        Loop 
        {
            Send ^2 ; excel
            Send {Right} ; next extra group
            Send ^c ; copy extra group name
            Send ^1 ; Manager
                If (Clipboard = "end" )
                {
                    Send {Esc}
                    Break addextra ; end adding extras
                }
            Click, 996 175 ; extra group search
            Send, ^v ; paste extra group name
            Send, {Down} ; -----------------------------------------------------this is tempoary
            Send, {Enter} ; apply extra group name
            Send, {Tab} ; go to Add existing extra group
            Send, {Enter} ; Add existing extra group
        }
goback:
Send ^2 ; excel
Send, ^{Left} ; far left row
Send, {Down} ; next product 

    }
Return

F8::
Suspend
Pause,, 1
Return