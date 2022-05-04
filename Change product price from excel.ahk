#SingleInstance, Force
; Manager tab 1, excel tab 2
; Product name in left row, price in 2nd row

+z::
SetKeyDelay, 200

Loop
{ 
Send ^c ; copy product name
    If (Clipboard = "end" ) ; end of the road!!!
    Return
Send ^1 ; manager
Click, 315 278 ; product search
Send ^v ; paste product name
Send ^2 ; go to excel
Send {Right} ; price row
Send ^c ; copy product price
Send ^1 ; go to manager

Searchfinish:
Loop { ; Check if search has finished
PixelGetColor, color, 1330, 918
if (color = 0xFFFFFF)
{
    Sleep 100
}
Else
{
Break Searchfinish
}
}
PixelGetColor, color, 1114, 510 ; check if there are more than one product and wait for input
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

Sleep 1000

SendInput, {Tab 8} ; navigate to price field
Sleep 200                               Caffe Latte 300ml
Send ^v ; paste price
Send {Enter} ; Update

Sleep 2000
PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600
Sleep 200

Click 315 278 ; search bar
Send ^a ; select all text in search
Send {Backspace} ; delete text in search bar
Send ^2 ; excel
Send, {Left} ; far left row
Send, {Down} ; next product 

    }
Return

F8::
Suspend
Pause,, 1
Return