#SingleInstance force
#noenv

z:: ; copy and find product
SetKeyDelay, 200
Send, ^c ; copy product name
Send, {Right} ; Extra groups row
Send, {Right} ; Extra groups row
Send, ^1 ; manager
Click, 315 278 ; search
Send, ^v ; paste product name
Sleep 500
Click, 530 400 ; open product information
Click, 340 663 0 ; move mouse near extra groups
Send {Pgup 2}
Return

x:: ; copy extra group name to excel
SetKeyDelay, 50
Click, X, Y, 3 ; select extra group
Send, ^c ; copy extra group name
Send, ^2 ; excel
Send, ^v ; paste extra group name
Sleep 200
Send, {Right} ; next row
Sleep 200
Send, ^1 ; manager

Return

c:: ; reset -> next product

Send, {PgUp 5}
Click, 530 400 ; close product
Click, 315 278 ; search
Send, ^a ; select all text in search
Send, {Backspace} ; delete text in search
Send, ^2 ; excel
Sleep 500
Send, end
Send, {Left 10} ; back to products row
Sleep 100
Send, {Down} ; next product

Return

F1:: ; add row below
SetKeyDelay, 100
Send, !{i}
Send, {Down 2}
Send, {Right}
Send, {Down}
Send, {Enter}
return