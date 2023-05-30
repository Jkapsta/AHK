#SingleInstance, Force
Setkeydelay 150

F7::
stop := false ; reset stop mechanic
Loop
{
    Send, {Esc} ; close product
    Send, {Tab} ; next product
    Send, {Enter} ; open next product
    Sleep 180 ; how long the product is open
    if (stop = True) ; if F8 is pressed stop
    {
        Break
    }
}
Return

F8:: ; stop script
stop := true
Return
