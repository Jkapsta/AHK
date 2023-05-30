#NoEnv
#SingleInstance, Force
SetKeyDelay, 200

F1:: ; add product one by one

Sendinput, {Tab 2} ; navigate to estonian name
Send, ^2

clipboard = 
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

clipboard = 
Send, ^c ; copy image name
Clipwait
image = %clipboard%

Send, ^1 ; manager

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
    Send, {Tab}

    clipboard = %engdesc%
    Send, ^v ; paste
    Send, {Tab}

    clipboard = %rusdesc%
    Send, ^v ; paste
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
}
Return


F2:: ; add product one by one
SetKeyDelay, 120
Loop {
Sendinput, {Tab 2}
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

clipboard = 
Send, ^c ; copy image name
Clipwait
image = %clipboard%

Send, ^1 ; manager

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
    Sendinput, {Up 10} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Else
    Send, {Tab}

    clipboard = %engdesc%
    Send, ^v ; paste
    If engdesc contains `n
    {
    Send, {Delete} ; delete last "
    Sendinput, {Up 10} ; navigate to first one
    Send, {Delete} ; delete first "
    }
    Send, {Tab}

    clipboard = %rusdesc%
    Send, ^v ; paste
    If rusdesc contains `n
    {
    Send, {Delete} ; delete last "
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



F4::
clipboard =
Send, ^c
ClipWait
var = %clipboard%
If var contains `n
{
    Send, {Right}
    Sendinput, detected
}
Else
{
    Send, {Right}
    Sendinput, not detected
}
Send, {Left}
Send, {Down}
Return















+^0:: ;
Setkeydelay 100
Send, ^1 ; Manager
Click 1827 205 ; Create
Send, ^2 ; sheets
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

If (price = "free")
{
    Send, {Enter}
}
Else
{
    Sendinput, {Tab 2} ; navigate to price type
    Sendinput, {Down 2} ; select paid
    Sendinput, {Enter} ; apply paid
    Sendinput, {Tab} ; navigate to price
    
    clipboard = %price%
    Send, ^v ; paste
    Send, {Tab} ; navigate to save
    Send, {Enter} ; Save extra
}

PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

Send, {Enter} ; open new extra again
Send, ^2 ; go to excel
Send, ^{Left} ; first row
Send, {Down} ; next extra
}
Return




+0::
SetKeyDelay, 120
Loop
{
    Send, ^1 ; manager
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
        Send, {Tab 3}
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
    
    Send, {Enter} ; save 
    Sleep 400
}
Return