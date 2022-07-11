; Right side edge window as small is it can be
; F1 - Copy product name from mouse location
; F1 + Shift - Copy product name to English name
; F2 - Copy product description from mouse location
; F2 + Shift - Copy product description from mouse location to english desc
; F3 - Copy product price from mouse location and translate fields
; F4 - Add product image with counter, to confirm selected image press 4, else click 5
; F4 + Shift - Just navigate to upload image and the rest is manual
; F5 - Save product and go to next product in Wolt
; F6 - Save without next product in wolt
; F8 - Replace English and Russian name with Estonian name value
; F11 - Generate better name traslation for Russian from English while keeping Estonian translation
; F12 - Generate better description traslation for Russian from English while keeping Estonian translation
; F12 + Shift - Generate better translation from English to both other languages
; Shift + Alt + 1 - Choose Estonian name location

; Shift + 0 - Add +1 to product counter
; Shift + 9 - Deduct -1 from product counter
; Shift + Alt + Z - Reset counter to 1
; Shift + Alt + X - Choose custome counter number


#SingleInstance, force
#NoEnv

Setkeydelay 100
CoordMode, Mouse , Screen
estnamex := 547
estnamey := 179

F1::
clipboard = 
MouseGetPos, xpos, ypos
Click, ,, 3 ; select product name in estonian
Send, ^c ; copy product name
ClipWait
Click, %estnamex% %estnamey%
Send, ^v ; paste product estonian name
Click, %xpos% %ypos% 0 ; move mouse back to prod name
Return

+F1::
clipboard = 
MouseGetPos, xpos, ypos
Click, ,, 3 ; select product name in estonian
Send, ^c ; copy product name
ClipWait
Click, %estnamex% %estnamey%
Sendinput, {Tab}
Send, ^v ; paste product estonian name
Click, %xpos% %ypos% 0 ; move mouse back to prod name
Return

F2:: 
clipboard =
Click, ,, 3 ; select product description
Send, ^c ; copy product description
Clipwait
Click, %estnamex% %estnamey%
Sendinput, {Tab 3} ; navigate to estonian description
Send, ^v ; paste product description
Send, {Backspace 2}
Click, %xpos% %ypos% 0 ; move mouse back to prod name
Return

+F2:: 
clipboard =
Click, ,, 3 ; select product description
Send, ^c ; copy product description
Clipwait
Click, %estnamex% %estnamey%
Sendinput, {Tab 4} ; navigate to estonian description
Send, ^v ; paste product description
Send, {Backspace 2}
Click, %xpos% %ypos% 0 ; move mouse back to prod name
Return

+^F2:: 
clipboard =
Send, ^c ; copy product description
Clipwait
Click, %estnamex% %estnamey%
Sendinput, {Tab 3} ; navigate to estonian description
Send, ^v ; paste product description
Send, {Backspace 2}
Click, %xpos% %ypos% 0 ; move mouse back to prod name
Return

F3::
clipboard =
Click, ,, 2 ; select product price
Send, ^c
Clipwait
Click, %estnamex% %estnamey%
Sendinput, {Tab 6} ; navigate to product price
Send, ^a
Send, ^v ; paste product price
Sendinput, {Tab 6} ; navigate to generate translations
Send, {Enter}
Sendinput, +{Tab 4} ; navigate to category
Sendinput, %category%
Send, {Enter}
Return

F4::
Sendinput, {Pgup 5}
Sleep 200
Counter++
Click, %estnamex% %estnamey%
Sendinput, {Tab 10} ; navigate to upload photo
Send, {Enter}
Pixelgetcolor, color, 719, 307 ; Wait for windows explorer
While !(color=0x191919)
Pixelgetcolor, color, 719, 307
Sendinput, Product
IfLess, counter, 10
    {
        Send, 0
    }
; IfLess, counter, 100
 ;   {
 ;       Send, 0
 ;   }
Send, %counter%
Send, {Down}
Send, {Enter}
Input, ready, L1
If (ready = 4)
{
    Sendinput, {Tab 7}
    Sendinput, {Enter}
}
If (ready = 5)
{
    Return
}
Return

+F4::
Sendinput, {Pgup 5}
Sleep 200
Click, %estnamex% %estnamey%
Sendinput, {Tab 10} ; navigate to upload photo
Send, {Enter}
Return

F5::
Sendinput, {Pgup 5}
Click, %estnamex% %estnamey%
Sleep 100
Click, %estnamex% %estnamey%
Send, {Enter} ; apply update
Pixelgetcolor, color, 100, 600 ; wait for update to end
While !(color=0xFFFFFF)
Pixelgetcolor, color, 100, 600
Send, {Enter}
Click %xpos% %ypos% ; move mouse back to prod desc
Send, {Esc} ; close current product
Sleep 200
Send, {Tab} ; navigate to next product
Send, {Enter} ; open next product
Return

F6::
Sendinput, {Pgup 5}
Click, %estnamex% %estnamey%
Sleep 100
Click, %estnamex% %estnamey%
Send, {Enter} ; apply update
Return

F8::
Sendinput, {PgUp 5}
Click, %estnamex% %estnamey%
Send, ^a
Send, ^c
Loop, 2
{
    Send, {Tab}
    Send, ^v
}
Return

F11::
Sendinput, {PgUp 5}
clipboard =
Click, %estnamex% %estnamey%
Send, ^a
Send, ^c
Send, {Backspace}
Sendinput, {Tab 2}
Send, {Backspace}
Sendinput, +{Tab 4}
Send, {Enter}
Sleep 500
Sendinput, {Tab 2}
Send, ^v
Return


F12::
Sendinput, {PgUp 5}
clipboard =
Click, %estnamex% %estnamey%
Sendinput, {Tab 3} ; navigate to estonan description
Send, ^a ; select whole field
Send, ^c ; copy content
Clipwait
Send, {Backspace}
Sendinput, {Tab 2}
Send, ^a ; select whole field
Send, {Backspace}
Sendinput, +{Tab 7}
Send, {Enter}
Sleep 1000
Sendinput, {Tab 5}
Sendinput, ^a
Sendinput, ^v
Return

+F12::
Sendinput, {PgUp 5}
Click, %estnamex% %estnamey%
Sendinput, {Tab 3}
Send, ^a ; select whole field
Send, {Backspace}
Sendinput, {Tab 2}
Send, ^a ; select whole field
Send, {Backspace}
Sendinput, +{Tab 7}
Send, {Enter}
Return

+!1::
MouseGetPos, estnamex, estnamey
MsgBox,  , Estonian name, New estonian name field location is %estnamex% %estnamey%, 2
Return

; -------------------------- COUNTER ADJUSTMENTS ------------------------------- ;

+!z::
Counter := 1 ; reset counter
ToolTip, %Counter% ; show counter number
Sleep 500
Tooltip ; reset tooltip
Return

+0::
Counter++ ; +1 to counter
ToolTip, %Counter% ; show counter number
Sleep 150
Tooltip ; reset tooltip
Return

+9::
Counter-- ; -1 to counter
ToolTip, %Counter% ; show counter number
Sleep 150
Tooltip ; reset tooltip
Return

!+x::
InputBox, Counter, Choose custom product number, Use this box to choose a custom product number after script reset
Return

^!+c::
InputBox, category , Category name, Write the category name in ALL CAPS
Return