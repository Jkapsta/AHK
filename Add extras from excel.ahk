;start at excel in tab 2 and manager in tab 1
; Full screen 100%
#SingleInstance force
#IfWinActive ahk_class Chrome_WidgetWin_1

+z::
Loop, 230 { ; Change this for the amount of products
Send ^c ; copy products name
Sleep 500
Send ^{Tab} ; go to manager
Sleep 200
Click, 352 280 ; click on search
Send ^v ; paste product name to search
Sleep 1500
Send {Tab 5} ; Manage extras
Send {Enter} 

; PixelGetColor, color, 1127, 164
; While !(color = "0xFFC445")
; PixelGetColor, color, 1127, 164
Sleep 1000

Send {Tab}
Send Extras ; Name of the extra group
Sleep 200
Send {Enter}
Send {Tab}
Sleep 400
Send {Enter}
Sleep 500

Send {Esc}
PixelGetColor, color, 100, 600
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

Sleep 200
Send +{Tab 5}
Send {Backspace}

Send ^{Tab}
Sleep 200
Send {Down}
Sleep 100
}
return



F8::
Suspend
Pause,, 1
Return