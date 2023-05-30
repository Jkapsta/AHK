#NoEnv
#SingleInstance, Force

F1:: ; change product names
SetKeyDelay, 130

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
Send, ^c ; copy eng name
Clipwait
engname = %clipboard%
Send, {Right}

clipboard = 
Send, ^c ; copy rus name
Clipwait
rusname = %clipboard%

Send, ^1 ; manager

Click ; product search