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
Send ^v ; paste product name
Send ^2 ; go to excel
Send {Right} ; category row
Send ^c ; copy category name
Send ^1 ; go to manager

Searchfinish:
Loop { ; Check if search has finished
PixelGetColor, color, 484, 333
if (color = 0xFAFAE6)
{
    Sleep 100
}
Elseif (color = 0xFAFAFA)
{
Break Searchfinish
}
}
Sleep 300
PixelGetColor, color, 1114, 510 ; check if there are more than one product
    If (Color = 0xFFFFFF )
    {
        Input, user, L1 ; click on 1 ; 2 ; 3 to select which product is the right one
        If (user = 1) ; first product
        {    
            Click, 1837 398 ; three dots
            Sleep 500
            Click, 1792 428 ; edit
        }
        If (user = 2) ; second product
        {    
            Click, 1837 465 ; three dots
            Sleep 500
            Click, 1792 506 ; edit
        }
        If (user = 3) ; third product
        {    
            Click, 1837 529 ; three dots
            Sleep 500
            Click, 1792 570 ; edit
        }
    }

    Else
    {
        Click, 1837 398 ; three dots
        Sleep 500
        Click, 1792 428 ; edit
    }

Sleep 500
SendInput, {Tab 10} ; navigate to category field
Send ^v ; paste category name
Send {Enter} ; apply category
SendInput, {Tab 6} ; go to Update
Send {Enter} ; Update

Sleep 2000
PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600
Sleep 200


Send, ^2 ; excel
Send, {Right}
Send, ^c
If (clipboard = "end") ; check if product has any extras or not
{
    Send, ^1 ; manager
}

Else
{
    Send, {Left}
    Send, ^1 ; Manager
    Sleep 600
    If (user = 1) ; first product
        {   
            ; Click, 1745 400 0 
            Click, 1745 400 ; Manage extras
        }
        If (user = 2) ; second product
        {   
            ; Click, 1745 461 0 
            Click, 1745 461 ; Manage extras

        }
        If (user = 3) ; third product
        {   
            ; Click, 1745 529 0 
            Click, 1745 529 ; Manage extras
        }
    Else
    {
        ; Click, 1745 400 0 
        Click, 1745 400 ; Manage extras
    }
    Sleep 1000
    ; PixelGetColor, color, 1168, 173 ; wait for manage extras
    ; While !(color = "0xFEAE1C")
    ; PixelGetColor, color, 1168, 173

        deleteextra:
        Loop ; delete existing extra groups
        { 
            Click, 1677 321 ; X remove
            Click, 1827 402 ; OK
            PixelGetColor, color, 1308 , 316 ; check if there is another
            Sleep 100
                If (Color = 0xFFFFFF)
                    Break deleteextra ; end deleting extras
        }
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
    }
Click 315 278 ; search bar
Send ^a ; select all text in search
Send {Backspace} ; delete text in search bar
Send ^2 ; excel
Send, ^{Left} ; far left row
Send, {Down} ; next product 

    }
Return

F8::
Suspend
Pause,, 1
Return