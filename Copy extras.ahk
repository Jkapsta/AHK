#SingleInstance, Force
SetKeyDelay 100

+z::
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

F1::
SetKeyDelay, 120
Send, {Tab}
Loop 3
{
Send, {Tab}
Send, ^c
Send, ^2
Send, ^v
Send, {Right}
Send, ^1
}
Send, {Esc}
Send, ^2
Sleep 100
Send, ^{Left 2}
Send, {Down}
Send, ^1
Return

F2::
SetKeyDelay, 120
Sendinput, {Tab 2} ; correction

clipboard =
Send, ^c ; copy extra name
Clipwait
estname = %clipboard%
Send, {Tab} ; next

clipboard =
Send, ^c ; copy extra name
Clipwait
engname = %clipboard%
Send, {Tab} ; next

clipboard =
Send, ^c ; copy extra name
Clipwait
rusname = %clipboard%

Sendinput, {Tab 2} ; check pos situation

clipboard =
Send, ^c ; copy pos id
Sleep 150
pos = %clipboard%

Sendinput, {Tab 2}

clipboard =
Send, ^c ; copy possible price
Sleep 150
price = %clipboard%
Send, {Esc} ; close product

Send, ^2 ; sheets

clipboard = %estname%
Send, ^v ; paste name
Send, {Tab} ; next

clipboard = %engname%
Send, ^v ; paste name
Send, {Tab} ; next

clipboard = %rusname%
Send, ^v ; paste name
Send, {Tab} ; next

clipboard = %pos%
Send, ^v ; paste pos
Send, {Tab} ; next

If price = 
{
    Sendinput, free
}
Else
{
    Sendinput, %price% ; paste price
}

Send, ^{Left 2} ; first column
Send, {Down} ; next row
Send, ^1 ; manager
Return


F8::
Suspend
Pause,, 1
Return