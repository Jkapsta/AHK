#SingleInstance, Force
SetKeyDelay, 100

F1:: ; delete all products
stop := false
Loop
{
    Click, 1781 403 ; three dots
    Sleep 150
    Click, 1781 515 ; delete button
    PixelGetColor, color, 100, 850 ; wait for manage extras screen
    While !(color = "0x8C8C8C")
    PixelGetColor, color, 100, 850
    Click, 1107 285 ; confirm delete
    Sleep 100
    PixelGetColor, color, 292, 317 ; wait for search to end
    While !(color = "0xFAFAFA")
    PixelGetColor, color, 292, 317
    If (stop = true) ; if F8 is pressed stop script
    {
        Return
    }
}
Return

F2:: ; delete categories
SetKeyDelay, 100
stop := false
Loop
{
    If (stop = true) ; if F8 is pressed stop script
    {
        Return
    }
    Click, 1732 345 ; trashcan
    Click, 1831 427 ; yes to delete
}
Return

F3:: ; delete extra groups
SetKeyDelay, 100
stop := false
Loop
{
    If (stop = true) ; if F8 is pressed stop script
    {
        Return
    }
    Click, 1515 350 ; trashcan
    Click, 1619 434 ; yes to delete
}
Return

F4:: ; delete extras
SetKeyDelay, 100
stop := false
Loop
{
    If (stop = true) ; if F8 is pressed stop script
    {
        Return
    }
    
    Click, 1800 401 ; trashcan
    Click, 1740 417 ; yes to delete
}
Return

F8:: ; stop script
stop := true
Return

^i::
MsgBox, F1 - Delete products. F2 - Delete categories. F3 - Delete extra groups. F4 - Delete extras
Return