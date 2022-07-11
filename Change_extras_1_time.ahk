; Start full screen with manager on tab 1 and excel tab 2
; Excel should be completed with "end" at stop points
; Microsoft Edge, 100% screen


#SingleInstance, force
#NoEnv

+z::

SetKeyDelay, 120

Send, {Right 2}
Send, ^c
If (clipboard = "end") ; check if product has any extras or not
{
    Goto finish
}
Send, {Left 2}
Send ^c ; copy product name
    If (Clipboard = "end" ) ; end of the road!!!
    Return
Send {Right}
Send ^1 ; manager
Click, 315 278 ; product search
Send ^a ; select all text in search
Send ^v ; paste product name
Send ^2 ; go to excel
Send ^1 ; go to manager
Sleep 100

PixelGetColor, color, 292, 317 ; wait for search to end
While !(color = "0xFAFAFA")
PixelGetColor, color, 292, 317

; Sendinput {Click 1786 277} ; reset tabing

PixelGetColor, color, 1114, 510 ; check if there are more than one product
    If (Color = 0xFFFFFF )
    {
        Input, user, L1 ; click on 1 ; 2 ; 3 to select which product is the right one
        If (user = 1) ; first product
        {   
            Click, 1753 400
        }
        Else If (user = 2) ; second product
        {   
            Click, 1753 465

        }
        Else If (user = 3) ; third product
        {   
            Click, 1753 528
        }
        Else If (user = 4) ; fourth product
        {   
            Click, 1753 592

        }
        Else If (user = 5) ; fifth product
        {   
            Click, 1753 660
        }
    }
    Else
    {
        Click, 1753 400
    }

    Sleep 200
    PixelGetColor, color, 1402, 257 ; wait for updating extra groups
    While !(color = "0xFAFAFA")
    PixelGetColor, color, 1402, 257
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
                ; Send, {Down} ; -----------------------------------------------------this is tempoary
                Send, {Enter} ; apply extra group name
                PixelGetColor, color, 1402, 257 ; wait for updating extra groups
                While !(color = "0xFAFAFA")
                PixelGetColor, color, 1402, 257
                Send, {Tab} ; go to Add existing extra group
                Send, {Enter} ; Add existing extra group
            }
Send ^2 ; excel
finish:
Send, ^{Left} ; far left row
Send, {Down} ; next product 

Return

F8::
Suspend
Pause,, 1
Return