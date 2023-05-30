#SingleInstance, Force
; Microsoft Edge 1920 x 1040 px window
; Variables
restaurantname = vapiano ; which restaurant will be searched after product created
status = active ; product status after creation

F1:: ; add product one by one
SetKeyDelay, 120
Loop {
Sendinput, {Tab 2} ; navigate to estonian name 
Send, ^2 ; excel
Loop 3 ; copy names
{
    clipboard =
    Send, ^c ; copy
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc} ; leave product
        Send, {F9} ; search new restaurant
        Return
    }
    Send, ^1 ; manager
    If (clipboard = "no")
    {
        Goto next
    }
    Else
    {
        Send, ^v ; paste
    }
    next:
    Send, {Tab} ; next field
    Send, ^2 ; excel
    Send, {Right} ; Next field
}
Loop 3 ; copy Desc
{
    clipboard =
    Send, ^c ; copy
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc} ; leave product
        Send, {F9} ; search new restaurant
        Return
    }
    Send, ^1 ; manager
    If (clipboard = "no")
    {
        Goto next1
    }
    Else
    {
        Send, ^v ; paste
        Send, +{Left} ; select last letter
        clipboard = ; clear clipboard
        Send, ^c ; copy last letter
        Clipwait ; wait for clipboard
        If clipboard = "
        {
            Send, {Delete} ; delete last "
            Sendinput, {Up 10} ; navigate to first one
            Send, {Delete} ; delete first "
        }
    }
    next1:
    Send, {Tab} ; next field
    Send, ^2 ; excel
    Send, {Right} ; Next field
}
Loop 3 ; copy the rest
{
    clipboard =
    Send, ^c ; copy
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc} ; leave product
        Send, {F9} ; search new restaurant
        Return
    }
    Send, ^1 ; manager
    If (clipboard = "no")
    {
        Goto next2
    }
    Else
    {
        Send, ^v ; paste
    }
    next2:
    Send, {Tab} ; next field
    Send, ^2 ; excel
    Send, {Right} ; Next field
}
; category accept
    Send, ^1 ; manager
    Send, +{Tab} ; navigate back to category
    Send, ^v ; paste category
    ; Send, {Down} ; --------------- temp
    Send, {Enter} ; apply category

    ; add picture
    Send, ^2 ; excel
    clipboard = ; clear clipboard
    Send, ^c ; copy picture cell
    Clipwait
    Send, ^1 ; manager
    If (clipboard = "no")
    {
        Sendinput, +{Tab}
        Goto save ; press enter to save product
    }
    Else
    {
        Send, ^1 ; manager
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
    }
    save:
    Sendinput, {Enter}

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

+2:: ; return back to A1 in excel
SetKeyDelay 100
Sleep 200
Send, ^2
Send, ^{Left}
Send, ^{Up 2}
Send ^1
Return

+0:: ; create categories from second
SetKeyDelay, 120
Loop
{
    Click, 1815 210 ; click on create
    Sleep 500
    Loop 3 ; category names  
    {
        Send, ^2 ; category tab
        clipboard =
        Send, ^c ; copy names
        Clipwait
            If (clipboard = "end")
            {
                Return
            }
        Send, {Right} ; next name
        Send, ^1 ; manager
        Send, {Tab} ; next name
        Send, ^v ; paste name
    }
    Loop 3 ; category descriptions
    {
        Send, ^2 ; category tab
        clipboard =
        Send, ^c ; copy names
        Clipwait
            If (clipboard = "no")
            {
                clipboard = 
            }
        Send, {Right} ; next desc
        Send, ^1 ; manager
        Send, {Tab} ; next desc
        Send, ^v ; paste name
        Send, +{Left} ; select last letter
        clipboard = ; clear clipboard
        Send, ^c ; copy last letter
        Sleep 200 ; wait for clipboard
        If clipboard = "
        {
            Send, {Delete} ; delete last "
            Sendinput, {Up 10} ; navigate to first one
            Send, {Delete} ; delete first "
        }
    }
    Send, ^2 ; category tab
    Send, ^{Left 2} ; first
    Send, {Down} ; next category
    Send, ^1 ; manager
    Send, {Tab}
    Send, {Enter} ; save category names
    Sleep 1000
}
Return

+!0:: ; create category from third tab
SetKeyDelay, 100
Loop 3 {
Send, ^3 ; category tab
clipboard =
Send, ^c ; copy names
Clipwait
Send, {Right} ; next name
Send, ^1 ; manager
Send, {Tab} ; next name
Send, ^v ; paste name
}
Send, ^3 ; category tab
Send, ^{Left 2} ; first
Send, ^1 ; manager
Send, {Enter} ; save category names
Return

^+x:: ; fill product from manager
Setkeydelay 100
Sendinput, {Tab} ; loop correction
Loop 3 ; product name copy
{
  Clipboard =
  Sendinput, {Tab}
  Send, ^c ; copy name
  Clipwait
  Send, ^2 ; excel
  Send, {Right} ; next cell
  Send, ^v ; paste product name
  Send, ^1 ; manager
}
Loop 5 ; description and price
{
  clipboard =
  Sendinput, {Tab} ; navigate to next field
  Send, ^a ; select all
  Send, ^c ; copy all text
  Clipwait, 0.5
  Send, ^2 ; excel
  Send, {Right} ; next cell
  If clipboard = 
  {
    Sleep 100
    Sendinput, no ; add no for no desc or no discount price
  }
  Else
  {
    Send, {Enter} ; open cell
    Send, ^v ; paste content
    Send, {Enter} ; confirm changes
    Send, {Up} ; navigate back to the correct cell
  }
  Send, ^1 ; manager
}
Send, ^2 ; excel
Send, {Right} ; next cell
Sendinput, INSERT CATEGORY HERE
Send, {Right} ; next cell
Sendinput, PICTURE NAME
Send, ^{Left 2} ; go back to row A
Send, {Down} ; next product ready
Send, ^1 ; manager
Return

!^+x:: ; fill product from manager
Setkeydelay 100
Sendinput, {Tab} ; loop correction
Loop 3 ; product name copy
{
  Clipboard =
  Sendinput, {Tab}
  Send, ^c ; copy name
  Clipwait
  Send, ^2 ; excel
  Send, ^v ; paste product name
  Send, {Right} ; next cell
  Send, ^1 ; manager
}
Send, {Esc} ; exit edit products
Send, ^2 ; sheets
Send, ^{Left 2} ; far left
Send, {Down} ; next row
Send, ^1 ; manager
Return

F9:: ;Search restaurant
Click, 1729 114 0
Sleep 100
Click, 1727 164
Send, %restaurantname%
Return



; temp


F4:: ; create extra with english name
Click, 1834 205
Sleep 400
Sendinput, {Tab 3} ; navigate to extra group english name
Sendinput, Kids toy ; english name
Sendinput, {Tab 5} ; Navigate to generate translations
Sendinput, {Enter} ; generate translation
Sleep 400
Sendinput, +{Tab} ; navigate to save
Sendinput, {Enter} ; generate translation
Return

F5:: ; create extra group
Click, 1834 205
Sleep 400
Sendinput, {Tab 3} ; navigate to extra group english name
Sendinput, Make the drink sweeter ; english name
Sendinput, {Tab 5} ; Navigate to generate translations
Sendinput, {Enter} ; generate translation
Sleep 400
Sendinput, +{Tab 3} ; navigate to option type
Sendinput, {Down 2} ; choose multiple choice
Sendinput, {Enter} ; choose multiple choice
Sendinput, {Tab 2} ; navigate to max selected extras
Sendinput, 4
Sendinput, {Tab} ; navigate to maximum quant...
Sendinput, 2
Click, 800 498 0 ; move mouse to required
Return

F6:: ; find the certain product and apply extra group
Click, 315 278 ; product search
Sendinput, Kids meal
Sleep 500
PixelGetColor, color, 292, 317 ; wait for search to end
While !(color = "0xFAFAFA")
PixelGetColor, color, 292, 317
Click, 1753 400 ; first product manage extras
Sleep 200
PixelGetColor, color, 1402, 257 ; wait for updating extra groups
While !(color = "0xFAFAFA")
PixelGetColor, color, 1402, 257
Send, {Tab}
Sendinput, Kids toy
Send, {Enter}
Send, {Tab}
Send, {Enter}
Send, {Esc}
Return


F8::
Suspend
Pause,, 1
Return

+::
SetKeyDelay, 140
Click, 336 112 ; reset tabbing
Sendinput, {Tab 3}
Loop 9
{
Sendinput, {Tab 4} ; navigate to next product extras
Sendinput, {Enter} ; open extra groups
Sleep 500
SendInput, {Tab} ; navigate to extra groups
Sendinput, Make the drink sweeter
Sendinput, {Enter} ; choose
Sendinput, {Tab}
Sendinput, {Enter}
Sendinput, {Esc}
Sleep 500
}
Return

F10:: ; add extra
Send, {Tab} ; navigate to add existing extra field
Sendinput, Burger extras ; extra group name
Send, {Enter} ; apply name
Send, {Tab} ; navigate to add
Send, {Enter} ; add extra group
Return

F11::
Sendinput, {Tab 10}
Sendinput, FUDY SPECIALS
Sleep 200
Send, {Enter}
Send, +{Tab}
Send, 6
Send, {Enter}
Return

F12:: ; inactive -> active from mouse location
Click 
Send, {Up}
Send, {Enter}
Return

^F12::
SetKeyDelay, 200

Return

+F12::
Setkeydelay 50
Click, 363 112 ; click to reset tabbing
Sendinput, {Tab 6} ; navigate to first product stauts
Send, {Enter} ; open dropdown
Send, {Up} ; choose Active
Send, {Enter} ; apply change
Loop 1
{
    Sendinput, {Tab 4} ; navigate to first product stauts
    Send, {Enter} ; open dropdown
    Send, {Up} ; choose Active
    Send, {Enter} ; apply change
}
Send, {F9}
Return



^i::
MsgBox, , Macro hotkeys, F1 - start adding products. Ctrl+Shift+X - fill product from manager. Shift+2 - Manual reset to first product in excel. F9 - Search for new restaurant. , 5
Return


+^0:: ;
Setkeydelay 100
Send, ^1 ; Manager
Click 1827 205 ; Create
Send, ^2
Loop {
    Send, ^c
        If (Clipboard = "end")
        {
            Send, ^{Up} ; back to start of excel
            Send, ^1 ; back to manager
            Send, {Esc 2} ; close add new extra
            Return
        }
    Send, ^1
    Sendinput, {Tab 2}
    Send, ^v ; paste estonian name
    Loop 2 
    { 
        Send, ^2 ;excel
        Send, {Right} ; next translation
        Send, ^c ; copy name
        Send, ^1 ; manager
        Send, {Tab} ; next row
        Send, ^v
    }
    Send, ^2 ; excel
    Send, {Right} ; price cell
    Send, ^c ; copy price
    If (clipboard = "free")
    {
    Send, ^1 ; manager
    Sendinput, {Tab 3}
    Send, {Enter}
    }
    
    Else
    {
    Send, ^1 ; manager
    Send, {Tab 2} ; Price type
    Send, {Down 2} ; choose Paid
    Send, {Enter} ; apply Paid
    Sendinput, {Tab} ; navigate to price
    Send, ^v ; paste price
    Send, {Tab} ; navigate to Save
    Send, {Enter} ; Save
    }


    PixelGetColor, color, 100, 600 ; wait for update to end
    While !(color = "0xFFFFFF")
    PixelGetColor, color, 100, 600

    Send, {Enter}
    Send, ^2
    Send, ^{Left}
    Send, {Down}
}
Return


F7::
SetKeyDelay, 120
Sendinput, {Tab 2} ; navigate to estonian name 
Send, ^2 ; excel
Loop 3 ; copy names
{
    clipboard =
    Send, ^c ; copy
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc} ; leave product
        Send, {F9} ; search new restaurant
        Return
    }
    Send, ^1 ; manager
    If (clipboard = "no")
    {
        Goto next5
    }
    Else
    {
        Send, ^v ; paste
    }
    next5:
    Send, {Tab} ; next field
    Send, ^a ; select all
    Send, ^2 ; excel
    Send, {Right} ; Next field
}
Loop 3 ; copy Desc
{
    clipboard =
    Send, ^c ; copy
    Clipwait
    If (clipboard = "end")
    {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc} ; leave product
        Send, {F9} ; search new restaurant
        Return
    }
    Send, ^1 ; manager
    If (clipboard = "no")
    {
        Goto next6
    }
    Else
    {
        Send, ^v ; paste
        Send, +{Left} ; select last letter
        clipboard = ; clear clipboard
        Send, ^c ; copy last letter
        Clipwait ; wait for clipboard
        If clipboard = "
        {
            Send, {Delete} ; delete last "
            Sendinput, {Up 10} ; navigate to first one
            Send, {Delete} ; delete first "
        }
    }
    next6:
    Send, {Tab} ; next field
    Send, ^a ; select all
    Send, ^2 ; excel
    Send, {Right} ; Next field
}
Send, ^{Left}
Send, {Down}
Send, ^1
Send, {Enter}
Return

