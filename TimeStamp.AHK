;	v20190325r074002550ß4484669
;	2019-03-25 07:40:04.550
;	d2w13y2019
;	2019084

#SingleInstance Force			; Reloads and replaces the current script without confirmation

SetWorkingDir, %A_ScriptDir%	; Changes the script's current working directory.

#Include %A_ScriptDir%\lib\MyVar.lib

Menu, Tray, Icon, %A_ScriptDir%\icon\16x16doc.ico			; Tray Icon setup

#^t::	;	Window + CTRL + t	-	Version TimeStamp
	FormatTime, time_Now, , yyyyMMddrHHmmss
	SendInput % "v" time_Now time_MilliSecond chr(223) time_BootTime			;	yyyy.MMdd.HHmmss.Msec bTick
Return


#+t::	;	Window + Shift + t	-	ISO Date
	StringRight time_YearWeek, A_YWeek, 2
	SendInput % "d" time_WeekDay "w" time_YearWeek "y" time_Year			;	DddWwwYyyyy
Return


#!t::	;	Window + Alt + t	-	Document DateTime Stamp
	time_Now := A_Now
	FormatTime, time_Now, , yyyy-MM-dd HH:mm:ss
	SendInput % time_Now "." time_MilliSecond			;	yyyy-MM-dd HH:mm:ss.Msec
Return


#^!t::	;	Window + CTRL + Alt + t	-	Day Of the Year
	FormatTime, time_Now, , YDay0
	SendInput % time_Year time_Now			;	dddyyyy
Return


Return

ExitApp			; Terminates the script unconditionally

+^r::Reload		; Reload This Script

+^x::ExitApp		; Shift-Ctrl-x ---> Terminates the script unconditionally

+^z::Pause		; Shift-Ctrl-z ---> Pauses the script's current thread
