;start at excel in tab 2 and manager in tab 1
; Full screen 100%
#SingleInstance force
#IfWinActive ahk_class Chrome_WidgetWin_1

+z::

InputBox, loopcount,, How many products?


Loop, %loopcount% { ; Change this for the amount of products
Send ^c ; copy products name
Sleep 500
Send ^{Tab} ; go to manager
Sleep 200
Click, 352 280 ; click on search
Send ^v ; paste product name to search
Sleep 300
If (Clipboard = end)
	return

Send ^{Tab}
Send {Right}
Sleep 300
Send ^c ; copy product category
Sleep 500
Send ^{Tab}
Sleep 300

Click, 1834 401 ; product settings
Sleep 300
Click, 1714 448 ; edit

PixelGetColor, color, 1280, 850
While !(color = "0xFFFFFF")
PixelGetColor, color, 1280, 850
Sleep 500

; Click, 1185 687 ; category tab
Send {Tab 10}
Send ^v ; paste category name
Send {Enter}
Sleep 200
Send {Tab 6} ; Update
Sleep 200
Send {Enter}

PixelGetColor, color, 100, 600
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

Click 352 280
Send ^a
Send {Backspace}
Send ^{Tab}
Sleep 200
Send {Left}
Sleep 100
Send {Down}
Sleep 100
}
Return

F8::
Suspend
Pause,, 1
Return
