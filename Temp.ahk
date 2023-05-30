#NoEnv
#SingleInstance, Force

+^x:: ; copy product to sheets
Setkeydelay 100
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
Send, ^{Left}
Send, {Down}
Send, ^1 ; manager
Return