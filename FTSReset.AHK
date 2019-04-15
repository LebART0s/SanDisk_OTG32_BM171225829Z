#SingleInstance Force			; Reloads and replaces the current script without confirmation

; Resets all AHK (Scripts) File Timestamps to January 01, 1980
FileSetTime, 19800101, %A_ScriptDir%\*.AHK, M	;	Modified
FileSetTime, 19800101, %A_ScriptDir%\*.AHK, C	;	Created
FileSetTime, 19800101, %A_ScriptDir%\*.AHK, A	;	Accessed

ExitApp
