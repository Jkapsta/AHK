#SingleInstance, Force
F1::
InputBox, discpercentage , Type discount percentage , Type in the percentage you wish the product to have example 20 ; this is an input box where you write out what % you want
clipboard = ; empty clipboard
Click 827 584 ; click on price
Send, ^a ; select price
Send, ^c ; copy price
ClipWait ; wait for clipboard data
price = %clipboard% ; clipboard = price
percentage := 1 - discpercentage / 100 ; turn 20 into 0.20
discount := percentage * price ; calculate
Send {Tab} ; go to discount price
Send %discount% ; paste discount price

Return

F2:: ; add certain price to extra
; InputBox, addprice , Type discount percentage , Type in how much you would like to add to the extra price ; this is an input box where you write out what % you want
addprice := 0.25 ; how much is added to the new price
clipboard = ; empty clipboard
Sendinput, {Tab 7} ; navigate to extra price
Send, ^c ; copy price
ClipWait ; wait for clipboard data
price = %clipboard% ; clipboard = price
newprice := price + addprice ; add new price extra to existing price
Send %newprice% ; paste new price
Sleep 200 ; wait before updating
Send, {Enter} ; apply update                            
Return

^i::
MsgBox, , Buttons, F1 - discount for products and F2 for add price to extra, 1000
Return

F3::
SetKeyDelay, 100
Sendinput, {Tab 8} ; navigate to product price
clipboard = ; clear clipboard
Send, ^c
Clipwait
oldprice = %clipboard%
newprice := oldprice + 3.5
Sendinput, %newprice%
Sendinput, {Tab}
Send, %oldprice%
Send, {Enter}
Return