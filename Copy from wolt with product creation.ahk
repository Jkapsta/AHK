#SingleInstance, force
#NoEnv

Setkeydelay 150

F1::
Click, ,, 3 ; select product name in estonian
Send, ^c ; copy product name
Send, ^2 ; manager
Click, 1831 207 ; Create product
Sleep 500
Send, {Tab 2} ; go to estonian name
Send, ^v ; paste product estonian name
Send ^1 ; wolt
Return

F2::
Click, ,, 3 ; select product description
Send, ^c ; copy product description
Send, ^2 ; manager
Send, {Tab 3} ; navigate to product description
Send, ^v ; paste product description
Send {Backspace 2}
Send, ^1 ; wolt
Return

F3::
Click, X Y 3 ; select product price
Sleep 200
Send, ^c
Send, ^2 ; manager
Send, {Tab 3} ; navigate to product price
Sleep 100
Send, ^v ; paste product price
Send, {Backspace 2}
Send, {Tab 6} ; navigate to generate translations
Send, {Enter}
Send, +{Tab 4} ; navigate to category
Return

F4::
Send, {Tab 2} ; navigate to upload photo
Send, {Enter}
Return

F5::
Send, +{Tab 3} ; go to update
Send, {Enter} ; apply update
Pixelgetcolor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
Pixelgetcolor, color, 100, 600
Send, ^1 ; wolt
Send, {Esc}
Return