; Start full screen with manager on tab 1 and excel tab 2
; Excel should be completed with "end" at stop points
; Microsoft Edge, 100% screen


#SingleInstance, force
#NoEnv
SetKeyDelay, 120
restaurantname = new york pizza


F1::
Loop
{
Send, ^2 ; sheets
clipboard = ; clear clipboard
Send ^c ; copy product name
Clipwait
    If (Clipboard = "end" ) ; end of the road!!!
    {
        Send, ^{Up} ; back to start
        Send, ^1 ; manager
        Send, {F9}
        Return
    }
Send ^1 ; manager
Click, 315 278 ; product search
Send ^a ; select all text in search
Send ^v ; paste product name
Send ^2 ; go to excel
Send, {Right 2} ; Price row
clipboard =
Send ^c ; copy Price
Clipwait
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
            Click, 1792 450 ; edit
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
        Click, 1792 450 ; edit
    }

Sleep 500

PixelGetColor, color, 690, 178 ; wait for edit screen
While !(color = "0x262626")
PixelGetColor, color, 690, 178

SendInput, {Tab 8} ; navigate to category field
Send ^v ; paste category name
Sleep 250
SendInput, +{Tab 4}
Send {Enter} ; apply category

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

F2:: ; change extra prices with default value
Loop
{
    Send, ^3 ; sheets
    clipboard =
    Send, ^c ; copy extra name
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; back to start
        Send, ^1 ; manager
        MsgBox, , Extras are done, You can stop now, 1
        Return
    }
    Send, ^1 ; manager
    Send, ^f ; search for extra
    Send, ^v ; paste extra name
    Send, {Enter} ; commit search

    Sleep 500
    PixelgetColor, color, 299, 552
    If color = 0xFF9632
    {
        Click, 1838 559
    }

    ;----This is where we wait for edit screen----;
    PixelGetColor, color, 84, 918 ; wait for edit screen via left menu
    While !(color = "0x8C8C8C")
    PixelGetColor, color, 84, 918 

    Sleep 500
    Sendinput, {Tab 6} ; navigate to price type 
    Send, {Down 2} ; choose paid
    Send, {Enter} ; confirm paid
    Send, {Tab} ; navigate to price
    Sendinput, 0.1 ; new price
    Sleep 300
    Send, {Enter} ; apply changes

    PixelGetColor, color, 84, 918 ; wait for update to end via left menu
    While !(color = "0xFFFFFF")
    PixelGetColor, color, 84, 918 

    Send, ^3 ; sheets
    Send, {Down} ; next extra
}
Return

F3:: ; change extra prices
Loop
{
    clipboard =
    Send, ^c ; copy extra name
    Clipwait
    extraname = %clipboard%
        If (clipboard = "end")
        {
            Send, ^{Up} ; back to start
            MsgBox, , Extras are done, You can stop now, 1
            Return
        }
    Send, {Right} ; new price cell
    clipboard =
    Send, ^c ; copy new price
    Clipwait
    Send, ^1 ; manager
    Send, ^f ; search for extra
    Sendinput, %extraname% ; paste extra name
    Send, {Enter} ; commit search

    ;----This is where we wait for edit screen----;
    PixelGetColor, color, 84, 918 ; wait for edit screen via left menu
    While !(color = "0x8C8C8C")
    PixelGetColor, color, 84, 918 

    Sleep 500
    Sendinput, {Tab 7} ; navigate to price 
    Send, ^v ; paste new price
    Sleep 300
    Send, {Enter} ; apply changes

    PixelGetColor, color, 84, 918 ; wait for update to end via left menu
    While !(color = "0xFFFFFF")
    PixelGetColor, color, 84, 918 

    Send, ^2 ; sheets
    Send, {Left} ; back to name cell
    Send, {Down} ; next extra
}
Return



F8::
Suspend
Pause,, 1
Return

F9:: ;Search restaurant
Click, 1729 114 0
Sleep 100
Click, 1727 164
Sendinput, %restaurantname%
Return

F4::

Click, 91 409 ; click on products
Sleep 1200

Loop
{ 
Send, ^2 ; sheets
clipboard = ; clear clipboard
Send ^c ; copy product name
Clipwait
    If (Clipboard = "end" ) ; end of the road!!!
    {
        Send, ^{Up} ; back to start
        Send, ^1 ; manager
        Break
    }
Send ^1 ; manager
Click, 315 278 ; product search
Send ^a ; select all text in search
Send ^v ; paste product name
Send ^2 ; go to excel
Send, {Right 2} ; Price row
clipboard =
Send ^c ; copy Price
Clipwait
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
            Click, 1792 450 ; edit
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
        Click, 1792 450 ; edit
    }

Sleep 500

PixelGetColor, color, 690, 178 ; wait for edit screen
While !(color = "0x262626")
PixelGetColor, color, 690, 178

SendInput, {Tab 8} ; navigate to category field
Send ^v ; paste category name
Sleep 250
SendInput, +{Tab 4}
Send {Enter} ; apply category

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

Click, 131 359
Click, 110 505
Sleep 1000

Loop
{
    Send, ^3 ; sheets
    clipboard =
    Send, ^c ; copy extra name
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; back to start
        Send, ^1 ; manager
        Sleep 300
        Send, {F9}
        Return
    }
    extraname = %clipboard%
    Send, {Right} ; extra price
    clipboard =
    Send, ^c ; copy extra price
    Clipwait 

    Send, ^1 ; manager
    Send, ^f ; search for extra
    Sendinput, %extraname% ; paste extra name
    Send, {Enter} ; commit search

    Sleep 500
    PixelgetColor, color, 299, 552
    If color = 0xFF9632
    {
        Click, 1838 559
    }

    ;----This is where we wait for edit screen----;
    PixelGetColor, color, 84, 918 ; wait for edit screen via left menu
    While !(color = "0x8C8C8C")
    PixelGetColor, color, 84, 918 

    Sleep 500
    ;Sendinput, {Tab 6} ; navigate to price type 
    ;Send, {Down 2} ; choose paid
    ;Send, {Enter} ; confirm paid
    Sendinput, {Tab 8} ; navigate to price
    Send, ^v ; paste extra price
    Sleep 300
    Send, {Enter} ; apply changes

    PixelGetColor, color, 84, 918 ; wait for update to end via left menu
    While !(color = "0xFFFFFF")
    PixelGetColor, color, 84, 918 

    Send, ^3 ; sheets
    Send, {Left} ; back to extra name
    Send, {Down} ; next extra
}
Return