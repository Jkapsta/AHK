#NoEnv
#SingleInstance, Force
Esc::exitapp
Setkeydelay 140

F1:: ; change extra names to english
Sendinput, {Tab 3} ; navigate to english name
clipboard =
Send, ^c ; copy english name
Clipwait
Sendinput, +{Tab} ; navigate to est name
Send, ^v ; paste to estonian name
Sendinput, {Tab 2} ; navigate to rus name
Send, ^v ; paste to russian name
Send, {Enter} ; save
Return


F2::
Send, {Tab} ; navigate to extra name
Sendinput, Packaging
Send, {Enter}
Send, {Tab} ; navigate to add
Send, {Enter} ; apply add
Send, {Esc}
Return

F3:: ; delete extras on product
Click 1662 320
Click 1814 410
Return

F4::
Loop
    {
        Send, {Enter}
        Send, ^{Left 2}
        Send, &
        Send, {Enter}
    }
Return