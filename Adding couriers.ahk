; AHK script to automate courier onboarding when it's not automatic yet. Works in Edge full screen with freshchat, support agent portal and teams excel;

z:: ; step 1, fetch name from freshchat
Click, 1696 250 3
Sleep 100
Send ^c ; copy name from freshchat
Click, 414 23 ; go to support agent
Click, 310 271
Send ^v
Sleep 400
Click 435 399 1

return

c:: ; step 3
Click 34 57 ; go back
Sleep 1000 ; wait
Click, 310 271
Send ^v
Click 1648 405 0

return

v:: ; last 4
Click 310 271
Send ^a
Send {Backspace}
Click 170 20
Click 250 604 0

return

x:: ; step 2
Click 632 19
Click 906 550
Sleep 200
Send ^f
Sleep 200
Send ^v
Sleep 200
Send {Enter}
Sleep 2000
Click 1168 507
Click, 414 23

return