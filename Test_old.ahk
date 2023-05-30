#SingleInstance, Force
SetKeyDelay 120


F1::
SetKeyDelay, 120
Send, {Right} ; go to english name
clipboard =
Send, ^c ; copy english name
Clipwait
Send, ^2 ; google translate
Click 400 300 ; on text field
Send, ^a ; select all
Send, ^v ; paste english text
Sleep 500
Click 993 293 3 ; click on first letter on translation
clipboard =
Send, ^c
Clipwait
Send, ^1 ; sheets
Send, {Left} ; back to estonian field
Send, {Enter} ; open
Send, ^a ; select all
Send, ^v ; paste new translation
Send, {Backspace}
Return

F8::
Suspend
Pause,, 1
Return


F3::
Sendinput, {Tab 5}

Send, ^a
clipboard = 
Send, ^c
Clipwait
est = %clipboard%

Sendinput, {Tab}
Send, ^a
clipboard = 
Send, ^c
Clipwait
eng = %clipboard%

Sendinput, {Tab}
Send, ^a
clipboard = 
Send, ^c
Clipwait
Return

F4::
Sendinput, %est%
Send, {Tab}
Sendinput, %eng%
Send, {Tab}
Send, ^v
Return


+^F3:: ; get english description
Loop
{
  clipboard =
  Send, ^c
  Clipwait
  If (clipboard = "end")
  {
    Return
  }
  Send, {Right} ; english desc cell
  Send, ^1 ; manager
  Click, 315 278 ; product search
  Send ^a ; select all text in search
  Send ^v ; paste product name
  Sleep 500

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

  
  PixelGetColor, color, 690, 178 ; wait for edit screen
  While !(color = "0x262626")
  PixelGetColor, color, 690, 178

  Sendinput, {Tab 4} ; russian name
  Loop 3
  {
    Send, {Tab} ; navigate to next name
    Send, ^a ; select all
    clipboard =
    Send, ^c
    Sleep 200
    Send, ^2 ; excel
    Send, {Enter} ; open field
    If (clipboard = "")
    {
      Sendinput, no
    }
    Else
    {
      Send, ^v
    }
    Send, {Tab}
    Send, ^1
  }
  Send, {Esc}
  Send, ^2
  Send, ^{Left 2} ; back to product name
  Send, {Down} ; next product
}
Return



+^F9::
SetKeyDelay, 100
clipboard = ; clear clipboard
Send, ^c ; copy cell
Clipwait
old = %clipboard% ; var old is now clipboard
Send, {Right} ; right cell
clipboard = ; clear clipboard
Send, ^c
Clipwait
Send, {Right} ; next cell
new = %clipboard%
If (old = new)
  {
  Sendinput, old
}
Else
{
  Sendinput, new
}
Return


+^F5:: ; check if new
; A row product name
; B row product eng desc 
SetKeyDelay, 120
Loop
{
  clipboard =
  Send, ^c
  Clipwait
  If (clipboard = "end")
  {
    Return
  }
  Send, ^1 ; manager
  Click, 315 278 ; product search
  Send ^a ; select all text in search
  Send ^v ; paste product name
  Send, ^2
  Send, {Right} ; english desc cell
  clipboard =
  Send, ^c
  Clipwait
  old = %clipboard%
  Send, ^1 ; manager
  Sleep 300
  
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

  
  PixelGetColor, color, 690, 178 ; wait for edit screen
  While !(color = "0x262626")
  PixelGetColor, color, 690, 178

  Sendinput, {Tab 6} ; navigate to english desc
  Send, ^a ; select all
  clipboard =
  Send, ^c
  Clipwait
  new = %clipboard%
  Send, {Esc}

  Send, ^2 ; excel
  
  Send, {Right}
  If (old = new)
  {
    Sendinput, old
  }
  Else
  {
    Sendinput, new
  }
  Send, ^{Left} ; back to product name
  Send, {Down} ; next product
}
Return


+^c::
Click ,, 2 ; select name
clipboard =
Sleep 100
Send, ^c ; copy product name
Sleep 100
ClipWait
Sendinput, {Tab 2} ; navigate to manage extras
Send, {Enter} ; open extras
Sleep 400 ; random wait
Sendinput, {Tab 6} ; navigate to add extra
Send, {Enter} ; open add extras
Sleep 400
Sendinput, {Tab 2} ; navigate to search
Send, ^v ; paste product name
Return




































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
      Click, 1817 396
      Sleep 150
      Click, 1740 448
    }
    If (user = 2) ; second product
    {    
      
      Click, 1818 463
      Sleep 150
      Click, 1722 511
    }
    If (user = 3) ; third product
    {    
      Click, 1818 528
      Sleep 150
      Click, 1737 578
    }
    If (user = 4) ; fourth product
    {    
      Click, 1820 593
      Sleep 150
      Click, 1728 643
    }
    If (user = 5) ; fifth product
    {
      Click, 1820 659
      Sleep 150
      Click, 1735 706
    }
    If (user = 0) ; hand select product
    {
        Sleep 100
    }
  }
  Else
  {
    Click, 1817 396
    Sleep 150
    Click, 1740 448
  }
  PixelGetColor, color, 684, 179 ; wait for edit screen
  While !(color = "0x262626")
  PixelGetColor, color, 684, 179

  Sendinput, {Tab 10} ; navigate to category
  clipboard = %category%
  Send, ^v ; write out category
  Sleep 100
  Send, {Enter} ; apply category
  Send, +{Tab} ; navigate to discount price
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
    Click, 1722 398
    Else If (user = 2)
    Click, 1726 468
    Else If (user = 3)
    Click, 1715 523
    Else If (user = 4)
    Click, 1740 593
    Else If (user = 5)
    Click, 1725 654
    Else
      Click, 1722 398

    Sleep 500
    PixelGetColor, color, 1402, 257 ; wait for updating extra groups
    While !(color = "0xFAFAFA")
    PixelGetColor, color, 1402, 257
    
    deleteextra:
    Loop ; for deleting extras
    {
      Click, 1660 321 ; click on x
      Click, 1811 407 ; click on yes
      PixelGetColor, color, 1862 , 318 ; check if there is another
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


+F2:: ; add product one by one
SetKeyDelay, 120
Loop 
{
Send, ^2 ; sheets

Send, ^c ; copy est name    
Clipwait
If (clipboard = "end")
  {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc} ; leave product
        Send, {F9} ; search new restaurant
        Return
    }
estname = %clipboard%
Send, {Right}

clipboard = 
Sendinput, ^c ; copy eng name
Clipwait
engname = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy rus name
Clipwait
rusname = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy est desc
Clipwait
estdesc = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy eng desc
Clipwait
engdesc = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy rus desc
Clipwait
rusdesc = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy price
Clipwait
price = %clipboard%
Sendinput, {Right}

clipboard = 
Send, ^c ; copy discprice
Clipwait
discprice = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy category
Clipwait
category = %clipboard%
Sendinput, {Right}

clipboard = 
Sendinput, ^c ; copy image name
Clipwait
image = %clipboard%

Send, ^1 ; manager
Sendinput, {Tab 2}

clipboard = %estname%
Sendinput, ^v ; paste
Sendinput, {Tab}

clipboard = %engname%
Sendinput, ^v ; paste
Sendinput, {Tab}

clipboard = %rusname%
Sendinput, ^v ; paste
Sendinput, {Tab}

If (estdesc = "no")
  {
    Sendinput, {Tab 3}
}
Else
{
    clipboard = %estdesc%
    Send, ^v ; paste
    If estdesc contains `n
    {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 10} ; navigate to first one
    Send, {Delete} ; delete first "
  }
    Send, {Tab}

    clipboard = %engdesc%
    Send, ^v ; paste
    If engdesc contains `n
      {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 10} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Send, {Tab}

    clipboard = %rusdesc%
    Send, ^v ; paste
    If rusdesc contains `n
    {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 10} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Send, {Tab}
}

clipboard = %price%
Send, ^v ; paste
Send, {Tab}

If (discprice = "no")
{
    Send, {Tab}
}
Else
{
    clipboard = %discprice%
    Send, ^v ; paste
    Send, {Tab}
}

clipboard = %category%
Send, ^v ; paste
Send, {Enter}

If (image = "no")
{
    Send, +{Tab} ; navigate to discprice
    Send, {Enter}
}
Else
  {
    clipboard = %image%
    Send, {Tab 3} ; navigate to upload picture
    Send, {Enter} ; press on upload picture

    Pixelgetcolor, color, 719, 307 ; Wait for windows explorer
    While !(color=0x191919)
    Pixelgetcolor, color, 719, 307

    Send, ^v ; paste product picture name
    Send, {Enter} ; open product image

    Pixelgetcolor, color, 723, 234 ; Wait for crop screen
    While !(color=0xF0F0F0)
      Pixelgetcolor, color, 723, 234
    Sleep 1000 ; random wait time for clicking crop
    ; Click, 1172 625 ; click on crop
    Sendinput, {Tab 7}
    Sendinput, {Enter}
    Sleep 500
    Pixelgetcolor, color, 833, 851 ; wait for the picture to be uploaded
    While !(color=0xFFFFFF)
    Pixelgetcolor, color, 833, 851

    Sleep 500 ; random wait for picture uploading
    Sendinput, +{Tab 3} ; navigate to save product
    Send, {Enter} ; save product
  }

; continue with extras or not
PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
  PixelGetColor, color, 100, 600

If (status = "inactive" )
    {
    Click, 1617 397 ; status bar
    Send, {Down} ; navigate to inactive
    Send, {Enter} ; make product inactive
  }
  
Send, ^2 ; excel
Send, {Right}
clipboard = ; clear clipboard
Send, ^c ; copy first extra name or end
ClipWait
If (clipboard = "end")
  {
    Goto end
}
Else
{
    Send, {Left} ; navigate back for loop
    Send, ^1 ; manager
    Click, 1756 394 ; click on manage extra on last product
    Sleep 200 ; random sleep
    Sendinput, {Tab} ; loop correction
    Send, ^2 ; excel
    Loop 
    {
    Send, {Right}
    clipboard = ; clear clipboard
    Send, ^c ; copy extra name
    ClipWait
    If (clipboard = "end")
    {
        
        Goto end
    }
    Else
    {
      Send, ^1 ; manager
        
        PixelGetColor, color, 63, 967 ; wait for manage extras screen
        While !(color = "0x8C8C8C")
        PixelGetColor, color, 63, 967 ; wait for manage extras screen

        ;PixelGetColor, color, 1402, 257 ; wait for updating extra groups
        ;While !(color = "0xFAFAFA")
        ;PixelGetColor, color, 1402, 257
        Sleep 300
        Send, ^v ; paste extra name
        Send, {Enter} ; confirm extra name 
        Send, {Tab} ; navigate to add
        Send, {Enter} ; add extra
        Send, +{Tab} ; go back to add extra field
        Send, ^2 ; excel
      }
    }
}
end:
Sendinput, ^{Left 2} ; estonian name row
Send, {Down} ; next product
Send, ^1 ; manager
Send, {Esc 2} ; escape from manage extras

PixelGetColor, color, 100, 600 ; wait for manage extras to close
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

Sleep 500
Click, 1837 208 ; click on create product

Pixelgetcolor, color, 805, 867 ; wait for edit screen
While !(color = 0xFAFAFA)
Pixelgetcolor, color, 805, 867
}
Return



+F12::
Sendinput, {Tab 11}
Sendinput, ALCOHOL
Send, {Enter}
Sendinput +{Tab 2}
Send, {Enter}
Return

4::
Click, 1500 485
Send, {Tab}
Send, {Enter}

PixelGetColor, color, 940, 98
While, !(color = "0xFFFFFF")
PixelGetColor, color, 940, 98

Send, {Esc}
Sleep 300 
Sendinput, {Tab 4}
Send, {Enter}
Return

5::
Click, 1500 485
Sendinput, {Tab 3}
Send, {Enter}

PixelGetColor, color, 940, 98
While, !(color = "0xFFFFFF")
PixelGetColor, color, 940, 98

Send, {Esc}
Sleep 300 
Sendinput, {Tab 4}
Send, {Enter}
Sleep 200
Click, 1682 325
Return

F9::
Counter++
Sendinput, product
If (Counter <= 10)
{
  Sendinput, 0
}
Sendinput, %Counter%
Sleep 500
Send, {Enter}
Return

+F9::
InputBox, Counter
Return

























+^F4:: ; change eng desc
; A row product name
; B row product eng desc 
SetKeyDelay, 120
Loop
{
  clipboard =
  Send, ^c
  Clipwait
  If (clipboard = "end")
  {
    Return
  }
  Send, ^1 ; manager
  Click, 315 278 ; product search
  Send ^a ; select all text in search
  Send ^v ; paste product name
  Send, ^2
  Send, {Right} ; est desc cell
  clipboard =
  Send, ^c
  Clipwait
  Send, ^1 ; manager
  Sleep 300

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

  
  PixelGetColor, color, 690, 178 ; wait for edit screen
  While !(color = "0x262626")
  PixelGetColor, color, 690, 178

  Sendinput, {Tab 5} ; navigate to est desc
  Send, ^a ; select all
  Send, ^v ; paste est desc
  If clipboard contains `n
    {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 20} ; navigate to first one
    Send, {Delete} ; delete first "
    }
  Sendinput, +{Tab 3} ; navigate to name
  Sleep 400
  Send, {Enter} ; apply changes
  
  PixelGetColor, color, 100, 600 ; wait for update to end
  While !(color = "0xFFFFFF")
  PixelGetColor, color, 100, 600

  Send, ^2 ; excel
  Send, {Left} ; back to product name
  Send, {Down} ; next product
}
Return