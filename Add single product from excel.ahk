#SingleInstance, Force
; Microsoft Edge 1920 x 1040 px window
; Variables
restaurantname = blender ; which restaurant will be searched after product created
status = active ; pr    oduct status after creation
posconf = no
dineinproduct = no
deliveryproduct = no
extraspos = no
automaticrestosearch = no
^+Esc::exitapp


F1:: ; add product one by one
SetKeyDelay, 140
Click, 1832 208 ; click on create product
mainloop:
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
        If (automaticrestosearch = "yes")
            {
                Gosub, ^F9
            }
        Else
            {
                Send, {F9} ; search new restaurant
            }
            Return
    }
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
Send, {Right}

clipboard = 
Send, ^c ; copy price
Clipwait
price = %clipboard%
Send, {Right}

clipboard = 
Send, ^c ; copy discprice
Clipwait
discprice = %clipboard%
Send, {Right}

clipboard = 
Send, ^c ; copy category
Clipwait
category = %clipboard%
Send, {Right}

If (posconf = "yes")
    {
        clipboard = 
        Send, ^c ; copy category
        Clipwait
        pos = %clipboard%
        Send, {Right}
    }

clipboard = 
Send, ^c ; copy image name
Clipwait
image = %clipboard%

Send, ^1 ; manager
Sleep 200
If (dineinproduct = "yes")
    {
        Click 952 181 ; mark it as dine in
        Send, {Tab} ; one extra for comp
    }
If (deliveryproduct = "yes")
    {
        Click 791 181 ; mark it as dine in
        Send, {Tab} ; one extra for comp
    }
Else
    {
        Sendinput, {Tab 2}
    }
clipboard = ; clear clipboard
Send, ^c ; copy possible name
Sleep 200
If !(clipboard = "")
    {
        Send, {Esc} ; close
        Sleep 200
        Send, {Enter}
        Sleep 500
        Sendinput, {Tab 2} ; navigate again
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
    Send, ^v ; paste
    If estdesc contains `n
    {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 20} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Send, {Tab}

    clipboard = %engdesc%
    Send, ^v ; paste
    If engdesc contains `n
    {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 20} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Send, {Tab}

    clipboard = %rusdesc%
    Send, ^v ; paste
    If rusdesc contains `n
    {
    Send, {Backspace} ; delete last "
    Sendinput, {Up 20} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Send, {Tab}
}

clipboard = %price%
Send, ^v ; paste
Send, {Tab}

If (discprice = "no")
    {
        Sleep 50
    }
Else
    {
        clipboard = %discprice%
        Send, ^v ; paste
    }
    
Send, {Tab 2}
clipboard = %category%
Send, ^v ; paste
Send, {Enter}

If (posconf = "yes")
    {

        If (pos != "no")
            {
                Sendinput, {Tab 3} ; navigate to pos
                clipboard = %pos%
                Send, ^v ; paste pos
                Sendinput, +{Tab 3}
            }
            
    }
If (image = "no")
    {
        Send, +{Tab} ; navigate to discprice
        Send, {Enter}
    }
Else
    {
        clipboard = %image%
        Send, {Tab 5} ; navigate to upload picture
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
        Send, {WheelUp}
        Pixelgetcolor, color, 835, 1022 ; wait for the picture to be uploaded
        While !(color=0xFFFFFF)
        Pixelgetcolor, color, 835, 1022

        Sleep 500 ; random wait for picture uploading
        Sendinput, +{Tab 3} ; navigate to save product
        Send, {Enter} ; save product
    }

; continue with extras or not
PixelGetColor, color, 100, 800 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 800

If (status = "inactive" )
    {
    Click, 1650 408 ; status bar
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
    Click, 1778 408 ; open pencil menu
    Sleep 150
    Click, 1778 442 ; click on manage extras
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
        
        PixelGetColor, color, 125, 997 ; wait for manage extras screen
        While !(color = "0x8C8C8C")
        PixelGetColor, color, 125, 997 ; wait for manage extras screen

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
Sleep 200
Sendinput, ^{Left 4} ; estonian name row
Send, {Down} ; next product
Send, ^1 ; manager
Send, {Esc 2} ; escape from manage extras

PixelGetColor, color, 100, 800 ; wait for manage extras to close
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 800

Sleep 500
Click, 1832 208 ; click on create product

Pixelgetcolor, color, 591, 159 ; wait for edit screen
While !(color = 0xFFFFFF)
Pixelgetcolor, color, 591, 159
}
clipboard =
Return

+2:: ; return back to A1 in excel
SetKeyDelay 100
Sleep 200
Send, ^2
Send, ^{Left}
Send, ^{Up}
Send ^1
Return

+0:: ; create new automatic categories 
SetKeyDelay, 120
Loop
{
    Send, ^1 ; manager
    Sleep 400
    Click, 1815 210 ; click on create
    
    Send, ^2 ; sheets

    Send, ^c ; copy est name
    Clipwait
    If (clipboard = "end")
        {
            Send, ^{Up} ; first product in excel
            Send, ^1 ; manager
            Return
        }
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

    Send, ^{Left} ; first row
    Send, {Down} ; next category
    Send, ^1 ; manager
    Send, {Tab} ; navigate to estonian name

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
    Sleep 400
    Send, {Enter} ; save 
    Sleep 1000
}
Return

+!0:: ; create category from third tab
SetKeyDelay, 120
Send, ^3 ; third tab for category

clipboard = 
Send, ^c ; copy rus name
Clipwait
estcat = %clipboard%
Send, {Right}

clipboard = 
Send, ^c ; copy est desc
Clipwait
engcat = %clipboard%
Send, {Right}

clipboard = 
Send, ^c ; copy eng desc
Clipwait
ruscat = %clipboard%
Send, ^{Left}

Send, ^1 ; manager
Send, {Tab}

clipboard = %estcat%
Send, ^v ; paste
Send, {Tab}

clipboard = %engcat%
Send, ^v ; paste
Send, {Tab}

clipboard = %ruscat%
Send, ^v ; paste

Sleep 200
Send, {Enter} ; save

Return

+^x:: ; copy product to sheets
Setkeydelay 150
Sendinput, {Tab 2} ; navigate to estonian name

clipboard = 
Send, ^c ; copy est name
Clipwait
estname = %clipboard%
Send, {Tab}

clipboard = 
Send, ^c ; copy eng name
Clipwait
engname = %clipboard%
Send, {Tab}

clipboard = 
Send, ^c ; copy rus name
Clipwait
rusname = %clipboard%
Send, {Tab}

Send, ^a ; select all
clipboard = 
Send, ^c ; copy est desc
estdesc = %clipboard%
Send, {Tab}

Send, ^a ; select all
clipboard = 
Send, ^c ; copy eng desc
engdesc = %clipboard%
Send, {Tab}

Send, ^a ; select all
clipboard = 
Send, ^c ; copy rus desc
rusdesc = %clipboard%
Send, {Tab}

clipboard = 
Send, ^c ; copy price
Clipwait
price = %clipboard%
Send, {Tab}

clipboard = 
Send, ^c ; copy discount price
discprice = %clipboard%

Send, {Tab 4}
clipboard = 
Send, ^c ; copy pos
pos = %clipboard%


Send, ^2 ; Sheets

clipboard = %estname%
Send, ^v ; paste
Send, {Tab}

clipboard = %engname%
Send, ^v ; paste
Send, {Tab}

clipboard = %rusname%
Send, ^v ; paste
Send, {Tab}

If (estdesc = "")
{
    Loop 3  
    {
        Sendinput, no
        Send, {Tab}
    }
    Goto, skipdesc
}

Send, {Enter}
clipboard = %estdesc%
Send, ^v ; paste
Send, {Tab}

Send, {Enter}
clipboard = %engdesc%
Send, ^v ; paste
Send, {Tab}

Send, {Enter}
clipboard = %rusdesc%
Send, ^v ; paste
Send, {Tab}

skipdesc:
clipboard = %price%
Send, ^v ; paste
Send, {Tab}

clipboard = %discprice%
If (discprice = "")
{
    Sendinput, no
}
Else
{
    Send, ^v ; paste
}

Send, {Tab}
Sendinput, CATEGORY
Send, {Tab}
Sendinput, PICTURE
Send, {Tab}
clipboard = %pos%
If (pos = "")
{
    Sendinput, no
}
Else
{
    Send, ^v ; paste
}
Send, ^{Left}
Send, {Down}
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

^F9:: ;Search automatic restaurant
Send, ^3 ; search restaurant tab
Sleep 500
clipboard =
Send, ^c ; copy restuarant name
Clipwait
If (clipboard = "end")
    {
        Return
    }
Send, {Down}

Send, ^1 ; manager
Sleep 500
Click, 1729 114 0
Sleep 100
Click, 1727 164
Send, ^v ; paste restaurant name
Sleep 500
Click, 1711 204 ; click on restaurant
Sleep 2000
Send, {F1}
Return


; temp

F4::Return

+F4:: ; create extra with english name
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
Sendinput, Choose ice cream ; english name
Sendinput, {Tab 5} ; Navigate to generate translations
Sendinput, {Enter} ; generate translation
Sleep 400
;Sendinput, +{Tab 3} ; navigate to option type
;Sendinput, {Down 2} ; choose multiple choice
;Sendinput, {Enter} ; choose multiple choice
;Sendinput, {Tab 2} ; navigate to max selected extras
;Sendinput, 4
;Sendinput, {Tab} ; navigate to maximum quant...
;Sendinput, 2
Click, 800 498 ; move mouse to required
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

F10:: ; add extra
Send, {Tab} ; navigate to add existing extra field
Sendinput, Packaging ; extra group name
Send, {Enter} ; apply name
Send, {Tab} ; navigate to add
Send, {Enter} ; add extra group
Send, {Esc}
Sleep 500
Send, {Tab 4}
Send, {Enter}
Return

F11:: ; add availability end time
SetKeyDelay, 120
MouseGetPos, x, y
Click 794 807 ; avalability time
Send, {Tab} ; navigate to availability time
SendInput, Monday
Send, {Enter}
SendInput, Tuesday
Send, {Enter}
SendInput, Wednesday
Send, {Enter}
SendInput, Thursday
Send, {Enter}
SendInput, Friday
Send, {Enter}
;SendInput, Saturday
;Send, {Enter}
;SendInput, Sunday
;Send, {Down}
;Send, {Enter}
Send, {Tab 2} ; navigate to start time
Sendinput, 11:15
Send, {Tab} ; navigate to end time
Sendinput, 15:15
Sendinput, +{Tab 7} ; navigate to saveable field
Send, {Enter} ; save
Click %x% %y% 0
Return

+F11::
Click 794 807 ; avalability time
Send, {Tab 3} ; navigate to availability start time
Sendinput, 11:30
Send, {Tab} ; navigate to end time
Sendinput, 16:00
Sendinput, +{Tab 3}
Return

F12:: ; inactive -> active from mouse location
Click 
Send, {Up}
Send, {Enter}
Return

+F12:: ; change status for multiple products in a row
delete = true
Setkeydelay 50
Click, 363 112 ; click to reset tabbing
Sendinput, {Tab 8} ; navigate to first product stauts
Send, {Enter} ; open dropdown
Send, {Up} ; choose Active
Send, {Enter} ; apply change
Loop 5 ; choose how many products minus one
{
    Sendinput, {Tab 5} ; navigate to first product stauts
    Send, {Enter} ; open dropdown
    Send, {Up} ; choose Active
    Send, {Enter} ; apply change
}
If delete = true
{
Loop 2 ; choose how many products minus one
{
    Sendinput, {Tab 5} ; navigate to first product stauts
    Send, {Enter} ; open dropdown
    Send, {Down} ; choose Active
    Send, {Enter} ; apply change
}
}
Send, {F9}
Return



^i::
MsgBox, , Macro hotkeys, F1 - start adding products. Ctrl+Shift+X - fill product from manager. Shift+2 - Manual reset to first product in excel. F9 - Search for new restaurant. , 5
Return


+^0:: ;

keydelay = 100
sheets = 2

Setkeydelay %keydelay%
Send, ^1 ; Manager
Click 1827 205 ; Create
Send, ^%sheets% ; sheets
Loop
{
Send, ^c ; copy est name
Clipwait
If (clipboard = "end")
    {
        Send, ^{Up} ; first product in excel
        Send, ^1 ; manager
        Send, {Esc 2} ; close add new extra
        Return
    }
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

If (extraspos = "yes")
{
    clipboard = 
    Send, ^c ; copy rus name
    Clipwait
    pos = %clipboard%
    Send, {Right}
}

clipboard = 
Send, ^c ; copy price
Clipwait
price = %clipboard%

Send, ^1 ; manager
Sendinput, {Tab 2}

clipboard = %estname%
Send, ^v ; paste
Send, {Tab}

clipboard = %engname%
Send, ^v ; paste
Send, {Tab}

clipboard = %rusname%
Send, ^v ; paste

If (extraspos = "yes")
    {
        Sendinput, {Tab 2} ; navigate to pos
        clipboard = %pos%
        Send, ^v ; paste pos
        Sendinput, +{Tab 2}
    }

If (price = "free")
{
    Send, {Enter}
}
Else
{
    SetKeyDelay, 150
    Send, {Tab 3} ; navigate to price type
    Send, {Down 2} ; select paid
    Send, {Enter} ; apply paid
    Send, {Tab} ; navigate to price
    
    clipboard = %price%
    Send, ^v ; paste
    ; Send, {Tab} ; navigate to save
    Send, {Enter} ; Save extra
}

Setkeydelay, %keydelay%
PixelGetColor, color, 100, 800 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 800

Send, {Enter} ; open new extra again
Send, ^%sheets% ; go to excel
Send, ^{Left 2} ; first row
Send, {Down} ; next extra
}
Return

F7::
SetKeyDelay, 130
Sendinput, {Tab 8} ; navigate to price
Sendinput, 4.57 ; new price
Send, {Enter} ; apply changes
Sleep 500
PixelGetColor, color, 100, 800
If (color !="0xffffff" )
{
    Send, {Esc}
    Sleep 200
}
; Send, {F9} ; search for new restaurant
Return

^F7::
Sendinput, {Tab 10} ; navigate to category
Send, {Backspace 3} ; delete categories
Sendinput, TEMPURA MAKI
Send, {Enter} ; apply category
Send, +{Tab} ; navigate back to disc price
Send, {Backspace} ; delete disc price
Send, {Enter} ; save product

Sleep 500
PixelGetColor, color, 100, 800
If (color !="0xffffff" )
{
    Send, {Esc}
    Sleep 200
}
Send, {F9}
Return

+F7::
Sendinput, {Tab 10} ; navigate to disc price
clipboard = FUDY SPECIALS
Send, ^v ; paste name
Send, {Enter} ; apply category
Send, +{Tab}
Sendinput, 7
Sendinput, {Tab 4} ; navigate to POS ID
Sendinput 6621
Send, {Enter}

Sleep 500
PixelGetColor, color, 100, 800
If (color !="0xffffff" )
{
    Send, {Esc}
    Sleep 200
}
Send, {F9}
Return

!F7:: ; whatever you want it to be
SetKeyDelay, 100
Sendinput, {Tab 2} ; move to est name

Send, {Right}
Send, +^{Left}
Sendinput, Magnum Double Chocolate Deluxe
Send, {Tab}

Send, {Right}
Send, +^{Left 2}
Sendinput, Magnum Double Chocolate Deluxe
Send, {Tab}

Send, {Right}
Send, +^{Left}
Sendinput, Magnum Double Chocolate Deluxe

Send, {Enter}
Return