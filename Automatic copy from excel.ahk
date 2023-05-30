; Start full screen with manager on tab 1 and excel tab 2
; Excel should be completed with "end" at stop points
; Microsoft Edge, 1920 x 1040


#SingleInstance, force
#NoEnv

^+F1::
SetKeyDelay, 120
Send, ^2 ; sheets
Loop
{
  clipboard =
  Send, ^c ; copy product name
  Clipwait
    If (clipboard = "end")
    {
      Send, ^{Up}
      Send ^1 ; manager
      Return
    }
  productname = %clipboard%
  Send, {Tab} ; next cell
  clipboard =
  Send, ^c ; copy product category
  Clipwait
  category = %clipboard%
  
  Send, ^1 ; manager
  Click 315 278 ; product search
  Send, ^a ; select all
  clipboard = %productname%
  Send, ^v ; paste product name
  Sleep 500 ; random wait
  
  PixelGetColor, color, 957, 327 ; wait for search to end
  While !(color = "0xFAFAFA")
  PixelGetColor, color, 957, 327

  PixelGetColor, color, 1114, 510 ; check if there are more than one product
  If (Color = 0xFFFFFF )
  {
    Input, user, L1 ; click on 1 ; 2 ; 3 to select which product is the right one
    If (user = 1) ; first product
    {    
      Click, 1770 400
      Sleep 150
      Click, 1770 473
    }
    If (user = 2) ; second product
    {    
      
      Click, 1770 462
      Sleep 150
      Click, 1770 530
    }
    If (user = 3) ; third product
    {    
      Click, 1770 549
      Sleep 150
      Click, 1770 614
    }
    If (user = 4) ; fourth product
    {    
      Click, 1770 607
      Sleep 150
      Click, 1770 680
    }
    If (user = 5) ; fifth product
    {
      Click, 1770 680
      Sleep 150
      Click, 1770 747
    }
    If (user = 0) ; hand select product
    {
        Sleep 100
    }
  }
  Else
  {
    Click, 1770 400
    Sleep 150
    Click, 1770 473
    user = 1
  }
  PixelGetColor, color, 684, 179 ; wait for edit screen
  While !(color = "0x262626")
  PixelGetColor, color, 684, 179

  Sendinput, {Tab 11} ; navigate to category
  clipboard = %category%
  Send, ^v ; write out category
  Sleep 100
  Send, {Enter} ; apply category
  Send, +{Tab 2} ; navigate to discount price
  Send, {Enter} ; save product

  PixelGetColor, color, 100, 600 ; wait for update to end
  While !(color = "0xFFFFFF")
  PixelGetColor, color, 100, 600

  Send, ^2 ; sheets

  Send, {Tab} ; go to possible extra
  clipboard =
  Send, ^c ; copy possible extra
  Clipwait
  If (clipboard = "end")
  Goto finish
  Else
  {
    Send, {Left} ; reset tabbing
    Send, ^1 ; manager
    Sleep 200
    If (user = 1)
    {
        Click, 1766 400
        Sleep 150
        Click, 1766 440
    }
    If (user = 2)
    {
        Click, 1766 461
        Sleep 150
        Click, 1766 500
    }
    If (user = 3)
    {
        Click, 1766 528
        Sleep 150
        Click, 1766 570
    }
    If (user = 4)
    {
        Click, 1766 596
        Sleep 150
        Click, 1766 635
    }
    If (user = 5)
    {
        Click, 1766 659
        Sleep 150
        Click, 1766 700
    }
    
    Sleep 500
    PixelGetColor, color, 1402, 257 ; wait for updating extra groups
    While !(color = "0xFAFAFA")
    PixelGetColor, color, 1402, 257

    deleteextra:
    Loop ; for deleting extras
    {
      Click, 1660 321 ; click on x
      Click, 1811 407 ; click on yes
      Sleep 200
      Click, 1387 298 0
      PixelGetColor, color, 1387, 298 ; check if there is another
      If (color = 0xFFFFFF)
        Break deleteextra
    }
    addextra:
    Loop ; for adding Extras
    {
      Send, ^2 ; sheets
      Send, {Tab} ; next
      clipboard =
      Send, ^c ; copy extra name
      Clipwait
      If (clipboard = "end")
      {
        Send, ^1 ; manager
        Send, {Esc} ; leave manage extras
        Goto, finish
      }
      Send, ^1 ; manager
      Click, 994 174 ; extra field
      Send, ^v ; paste extra name
      Send, {Enter} ; choose said extra
      Sleep 300
      PixelGetColor, color, 1402, 257 ; wait for updating extra groups
      While !(color = "0xFAFAFA")
      PixelGetColor, color, 1402, 257
      Send, {Tab} ; go to add existing extra
      Send, {Enter} ; add said extra
    }
  }
  finish:
  Send, ^2 ; manager
  Send, ^{Left} ; first row
  Send, {Down} ; next product
  user := 1
}
Return




F8::
Suspend
Pause,, 1
Return


+!^z::

SetKeyDelay, 120

Loop
{ 
Send ^c ; copy product name
    If (Clipboard = "end" ) ; end of the road!!!
    Return
Send ^1 ; manager
Sleep 100
Click, 315 278 ; product search
Send ^a ; select all text in search
Send ^v ; paste product name
Send ^2 ; go to excel
Send {Right} ; category row
Send ^c ; copy category name
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
            Sleep 100
            Click, 1792 450 ; edit
        }
        If (user = 2) ; second product
        {    
            Click, 1837 465 ; three dots
            Sleep 100
            Click, 1792 506 ; edit
        }
        If (user = 3) ; third product
        {    
            Click, 1837 529 ; three dots
            Sleep 100
            Click, 1792 570 ; edit
        }
        If (user = 4) ; fourth product
        {    
            Click, 1837 594 ; three dots
            Sleep 100
            Click, 1792 633 ; edit
        }
        If (user = 5) ; fifth product
        {    
            Click, 1837 658 ; three dots
            Sleep 100
            Click, 1792 700 ; edit
        }
        If (user = 0) ; hand select product
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

Sleep 100

PixelGetColor, color, 690, 178 ; wait for edit screen
While !(color = "0x262626")
PixelGetColor, color, 690, 178

SendInput, {Tab 10} ; navigate to category field
Send ^v ; paste category name
Sleep 150
; Send, {Down} ; ------------------------------- temp
Send {Enter} ; apply category
Sleep 100
SendInput, +{Tab 2} ; go to Update
Send {Enter} ; Update

PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600


Send, ^2 ; excel
Send, {Right}
clipboard =
Send, ^c
ClipWait
If (clipboard = "end") ; check if product has any extras or not
{
    Goto finish1
}

Else
{
    Send, {Left}
    Send, ^1 ; Manager
    Sleep 100
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
    Else If (user = 0)
        {
            Sleep 100
        }
    Else
    {
        Click, 1753 400
    }
    Sleep 200
    PixelGetColor, color, 1402, 257 ; wait for updating extra groups
    While !(color = "0xFAFAFA")
    PixelGetColor, color, 1402, 257

        deleteextra1:
        Loop ; delete existing extra groups
        { 
            Click, 1677 321 ; X remove
            Click, 1827 402 ; OK
            PixelGetColor, color, 1308 , 316 ; check if there is another
            Sleep 50
                If (Color = 0xFFFFFF)
                    Break deleteextra1 ; end deleting extras
        }
            addextra1: ; add extras one by one
                Loop 
                {
                    Send ^2 ; excel
                    Send {Right} ; next extra group
                    Send ^c ; copy extra group name
                    Send ^1 ; Manager
                        If (Clipboard = "end" )
                        {
                            Send {Esc}
                            Break addextra1 ; end adding extras
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
    }
Send ^2 ; excel
finish1:
Send, ^{Left} ; far left row
Sleep 100
Send, {Down} ; next product 
user := 1
    }
Return
