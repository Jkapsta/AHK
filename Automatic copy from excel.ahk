; Start full screen with manager on tab 1 and excel tab 2


Loop x {; How many products?

Send ^c ; copy product name
Send ^1 ; manager
Click ; search
Send ^v ; paste product name
Send ^2 ; go to excel
Send {Right} ; category row
Send ^c ; copy category name
Send ^{Tab} ; go to manager

Click ; three dots
Click ; edit

PixelGetColor, color, 1280, 850 ; wait for search to complete
While !(color = "0xFFFFFF")
PixelGetColor, color, 1280, 850

Send {Tab 10}
Send ^v ; paste category name
Send {Enter}
Sleep 200
Send {Tab 6} ; go to Update
Sleep 200
Send {Enter} ; Update

PixelGetColor, color, 100, 600 ; wait for update to end
While !(color = "0xFFFFFF")
PixelGetColor, color, 100, 600

Click ; manage extras

PixelGetColor, color, x , y ; check if product has extras
If (Color = x kollane) {
    Loop 10 {
        Click ; trashcan
        Click ; OK
        }
    addextra: ; add extras one by one
        Loop 10 {
            Send ^2 ; excel
            Send {Right} ; next extra
            Send ^c ; copy extra group name
            Send ^1 ; Manager
            Click ; extra group tab
            Click ; Add existing extra group
                If (Clipboard = "end") {
                    Send {Esc}
                    Break addextra ; end adding extras
                    }
                }
            }
    else {
        Send {Esc}
    }

Click ; search bar
Send ^a ; select all text in search
Send {Backspace} ; delete text in search bar
Send ^2 ; excel
Send ^{Left} ; far left row
Send {Down} ; next product

}
Return