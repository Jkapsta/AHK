#SingleInstance force
#noenv

z:: ; copy and find product

Send, ^c ; copy product name
Send, {Right 2} ; Extra groups row
Send, ^1 ; manager
Click, 315 278 ; search
Send, ^v ; paste product name
Sleep 500
Click, 530 400 ; open product information
Click, 340 663 0 ; move mouse near extra groups

Return

x:: ; copy extra group name to excel

Click, X, Y, 3 ; select extra group
Send, ^c ; copy extra group name
Send, ^2 ; excel
Send, ^v ; paste extra group name
Send, {Right} ; next row
Send, ^1 ; manager

Return

c:: ; reset -> next product

Click, 530 400 ; close product
Click, 315 278 ; search
Send, ^a ; select all text in search
Send, {Backspace} ; delete text in search
Send, ^2 ; excel
Send, ^{Left} ; back to products row
Send, {Down} ; next product

Return