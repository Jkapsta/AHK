; Start full screen with manager on tab 1 and excel tab 2
; Excel should be completed with "end" at stop points
; Microsoft Edge, 100% screen


#SingleInstance, force
#NoEnv

+z::

SetKeyDelay, 100
Loop
{ 
Send ^c ; copy product name
    If (Clipboard = "end" ) ; end of the road!!!
    Return
Send ^1 ; manager
Click, 315 278 ; product search
Send ^a ; select all text in search
Send ^v ; paste product name
Send ^2 ; go to excel
Send {Right} ; Russian row
Send ^c ; copy Price
Send ^1 ; go to manager
Sleep 100

PixelGetColor, color, 292, 317 ; wait for search to end
While !(color = "0xFAFAFA")
PixelGetColor, color, 292, 317


PixelGetColor, color, 1114, 510 ; check if there are more than one product
    If (Color = 0xFFFFFF )
    {
        Input, user, L1 ; click on 1 ; 2 ; 3 to select which product is the right one
        If (user = 1) ; first product
        {    
            Click, 1837 398 ; three dots
            Sleep 200
            Click, 1792 428 ; edit
        }
        If (user = 2) ; second product
        {    
            Click, 1837 465 ; three dots
            Sleep 200
            Click, 1792 506 ; edit
        }
        If (user = 3) ; third product
        {    
            Click, 1837 529 ; three dots
            Sleep 200
            Click, 1792 570 ; edit
        }
        If (user = 4) ; fourth product
        {    
            Click, 1837 594 ; three dots
            Sleep 200
            Click, 1792 633 ; edit
        }
        If (user = 5) ; fifth product
        {    
            Click, 1837 658 ; three dots
            Sleep 200
            Click, 1792 700 ; edit
        }
        If (user = 0) ; fifth product
        {    
            Sleep 100
        }
    }

    Else
    {
        Click, 1837 398 ; three dots
        Sleep 200
        Click, 1792 428 ; edit
    }

Sleep 500

PixelGetColor, color, 690, 178 ; wait for edit screen
While !(color = "0x262626")
PixelGetColor, color, 690, 178

SendInput, {Tab 4} ; navigate to category field
Send ^v ; paste category name
Send, ^2
Send, {Right}
Send, ^c
Send, ^1
    If (clipboard = "end")
    {
        Goto complete
    }
Sendinput, {Tab 3}
Send, ^a
Send, ^v
Sendinput, +{Tab 3}

complete:
Send, {Enter}


PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

If (user = 0) ; fifth product
        {    
            Sendinput, {PgUp 5}
        }
Send ^2 ; goto excel
Send, ^{Left} ; far left row
Send, {Down} ; next product 
user := 1
    }
Return

F8::
Suspend
Pause,, 1
Return