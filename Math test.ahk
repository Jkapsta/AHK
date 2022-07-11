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
