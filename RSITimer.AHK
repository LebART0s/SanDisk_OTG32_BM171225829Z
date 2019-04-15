#SingleInstance Force        ; Reloads and replaces the current script without confirmation

; Still Work In Prtogress (SWIP)

#Include %A_ScriptDir%\lib\PleasantNotify.lib

Menu, Tray, Icon, AHK_Icons\16x16timer.ico			; Tray Icon setup

#Persistent						; Keeps a script permanently running (that is, until the user closes it or ExitApp is encountered).

;SetTimer, RSINotify, 10000						;	Ten Seconds

;SetTimer, RSINotify, 60000						;	One Minute

;SetTimer, RSINotify, 1800000					;	Thirty Minutes

SetTimer, RSINotify, 3600000					;	Sixty Minutes

;SetTimer, RSINotify, 5400000					;	Ninety Minutes

;SetTimer, RSINotify, 7200000					;	Two Hours

;SetTimer, RSINotify, 10800000					;	Three Hours

Return

RSINotify:

	PleasantNotify("Repetitive Strain Injury", "GET UP Move Around" , 325, 100, "b r", "30")
	
	Return
