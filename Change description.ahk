#NoEnv
#SingleInstance, Force
restaurantname = MySushi
dineinproduct = no    
SetKeyDelay, 120
^+Esc::exitapp

+^F4:: ; change product name
Send, ^2 ; sheets
Sleep 100
Loop
{
  clipboard =
  Send, ^c
  Clipwait
  If (clipboard = "end")
  {
    Send, ^{Up} ; go to top
    Send, ^1 ; manager
    Send, {F9} ; search new restaurant
    Return
  }
  search = %clipboard%
  Send, {Right}

    clipboard = 
    Send, ^c ; copy est name
    Clipwait
    estname = %clipboard%
    Send, {Right}

    clipboard = 
    Send, ^c ; copy eng name
    Clipwait
    engname = %clipboard%
    Send, {Right}

    clipboard = 
    Send, ^c ; copy rus name
    Clipwait
    rusname = %clipboard%
    Send, {Right}

    clipboard = 
    Send, ^c ; copy est desc
    Clipwait
    estdesc = %clipboard%
    Send, {Right}

    clipboard = 
    Send, ^c ; copy eng desc
    Clipwait
    engdesc = %clipboard%
    Send, {Right}

    clipboard = 
    Send, ^c ; copy rus desc
    Clipwait
    rusdesc = %clipboard%
  
  Send, ^1 ; manager
  Click, 315 278 ; product search
  Send ^a ; select all text in search
  clipboard = %search%
  Send ^v ; paste product name
  Sleep 600
  
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
    If (user = 9)
    {
        Goto next
    }
  }
  Else
  {
    Click, 1770 400
    Sleep 150
    Click, 1770 473
    user = 1
  }
  If (dineinproduct = yes)
    {
      Sleep 1000
    }
  Else
    {
      PixelGetColor, color, 684, 179 ; wait for edit screen
      While !(color = "0x262626")
      PixelGetColor, color, 684, 179
    }

  Send, {Tab 2}
  If (dineinproduct = "yes")
    {
      Send, {Tab 1}
    }

  clipboard = %estname%
  Send, ^v ; paste
  Send, {Tab}
  
  clipboard = %engname%
  Send, ^v ; paste
  Send, {Tab}
  
  clipboard = %rusname%
  Send, ^v ; paste
  Send, {Tab}
  
  If (estdesc = "no")
  {
      Send, {Tab 3} 
  }
  Else
  {
      clipboard = %estdesc%
      Send, ^a ; select all
      Send, ^v ; paste
      If estdesc contains `n
      {
      Send, {Backspace} ; delete last "
      Sendinput, ^{Up 20} ; navigate to first one
      Send, {Delete} ; delete first "
      }
      Send, {Tab}
  
      clipboard = %engdesc%
      Send, ^a ; select all
      Send, ^v ; paste
      If engdesc contains `n
      {
      Send, {Backspace} ; delete last "
      Sendinput, ^{Up 20} ; navigate to first one
      Send, {Delete} ; delete first "
      }
      Send, {Tab}
  
      clipboard = %rusdesc%
      Send, ^a ; select all
      Send, ^v ; paste
      If rusdesc contains `n
      {
      Send, {Backspace} ; delete last "
      Sendinput, ^{Up 20} ; navigate to first one
      Send, {Delete} ; delete first "
      }
      Send, {Tab}
  }
  Send, {Enter} ; apply changes
  
  PixelGetColor, color, 100, 800 ; wait for update to end
  While !(color = "0xFFFFFF")
  PixelGetColor, color, 100, 800
  
  next:
  Send, ^2 ; excel
  Send, ^{Left} ; back to product name
  Send, {Down} ; next product
}
Return

+^F5:: ; change extra names
Send, ^2 ; sheets
Sleep 100
Loop
{
  clipboard =
  Send, ^c
  Clipwait
  If (clipboard = "end")
  {
    Send, ^{Up} ; go to top
    Send, ^1 ; manager
    Send, {F9} ; search new restaurant
    Return
  }
  search = %clipboard%
  Send, {Right}

  clipboard = 
  Send, ^c ; copy est name
  Clipwait
  estname = %clipboard%
  Send, {Right}

  clipboard = 
  Send, ^c ; copy eng name
  Clipwait
  engname = %clipboard%
  Send, {Right}

  clipboard = 
  Send, ^c ; copy rus name
  Clipwait
  rusname = %clipboard%

  Send, ^1 ; manager
  Sleep 100
  Send, ^f ; search for extra
  clipboard = %search%
  Send, ^v ; paste search term
  ;Send, {Enter} ; apply search

  PixelGetColor, color, 84, 918 ; wait for edit screen via left menu
  While !(color = "0x8C8C8C")
  PixelGetColor, color, 84, 918
  Sleep 500
  Sendinput, {Tab 2} ; navigate to est name

  clipboard = %estname%
  Send, ^v ; paste est name
  Send, {Tab}

  clipboard = %engname%
  Send, ^v ; paste est name
  Send, {Tab}

  clipboard = %rusname%
  Send, ^v ; paste est name

  Send, {Enter} ; apply updates
  PixelGetColor, color, 84, 918 ; wait for edit screen via left menu
  While !(color = "0xFFFFFF")
  PixelGetColor, color, 84, 918

  Send, ^2 ; excel
  Send, ^{Left} ; back to product name
  Send, {Down} ; next product
}
Return

F9:: ;Search restaurant
Click, 1729 114 0
Sleep 100
Click, 1727 164
Sendinput, %restaurantname%
Return