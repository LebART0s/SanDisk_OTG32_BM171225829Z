tto\t6/55	Grand Lotto 6-55tto\t6/55	Grand Lotto 6-55; Initial Script Setup ============================================================================
; =================================================================================================

#SingleInstance Force		; Reloads and replaces the current script without confirmation

#NoEnv						; Recommended for performance and compatibility with future AutoHotkey releases.
							; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).

;SetWorkingDir, C:\Users\Public\Public AHK

SetWorkingDir, %A_ScriptDir%	; Ensures a consistent starting directory.

SendMode Input				; Recommended for new scripts due to its superior speed and reliability.

SetCapsLockState Off		; Sets the state of the CapsLock

SetNumLockState On			; Sets the state of the NumLock

SetScrollLockState Off		; Sets the state of the ScrollLock

SetMouseDelay, 10			; Sets the delay that will occur after each mouse movement or click.

SetDefaultMouseSpeed, 2		; Sets the mouse speed that will be used if unspecified in Click and MouseMove/Click/Drag.

SetKeyDelay, 10				; Sets the delay that will occur after each keystroke sent by Send and ControlSend.

SetWinDelay, 100			; Sets the delay that will occur after each windowing command, such as WinActivate

SetBatchLines, 10ms			; Determines how fast a script will run (affects CPU utilization).

SetControlDelay, 20			; Sets the delay that will occur after each control-modifying command.

#InstallKeybdHook			; For Debugging

#InstallMouseHook			; For Debugging


; Global Variable Declaration =====================================================================
; =================================================================================================


; Main Script =====================================================================================
; =================================================================================================

^+a::
;	Run "C:\Program Files\Notepad++\notepad++.exe"
;	Sleep 100
	Run http://pcso.gov.ph/SearchLottoResult.aspx
	Sleep 2000
	Send, {tab 14}
	Sleep, 100
	Send, {Up 31}
	Sleep, 100
	Send, {tab 5}
	Sleep, 100
	Send, {Down}					; Select UltraLotto 6/58
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, {Enter}
	Sleep, 500
	Send, {PgDn}
	Sleep, 500
	MouseMove, 122, 225
	Sleep, 100
	Send, {LButton Down}
	Sleep, 100
	Send, {PgDn 5}
	Sleep, 100
	Mousemove, 825, 250
	Sleep, 100
	Send, {LButton Up}
	Sleep, 100
	Send, {Ctrl Down}c{Ctrl Up}

	IfWinExist Notepad++
	{
		WinActivateBottom, Notepad++
		Send, 100
		Send, {Ctrl Down}n{Ctrl Up}
		Sleep, 100
		Send, {Ctrl Down}v{Ctrl Up}
		Sleep, 100
		Send, {Ctrl Down}s{Ctrl Up}
		Sleep, 100
		Send, Data\PCSO-658.txt
		Sleep, 100
		Send, {Enter}
		Sleep, 100
	}
	Else
	{
		Run "C:\Program Files\Notepad++\notepad++.exe"
		Sleep, 100
		Send, {Ctrl Down}n{Ctrl Up}
		Sleep, 100
		Send, {Ctrl Down}v{Ctrl Up}
	}
/* 
	Sleep, 1000
	WinActivateBottom, Philippine Charity Sweepstakes Office
	Sleep, 2000
	loop, 46
	{
		Send, {tab}
		Sleep, 100
	}
	Send, {Down}					; Select UltraLotto 6/58
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, {Enter}
	Sleep, 500

	Send, {PgDn}
	Sleep, 500
	MouseMove, 122, 225
	Sleep, 100
	Send, {LButton Down}
	Sleep, 100
	Send, {PgDn 5}
	Sleep, 100
	Mousemove, 825, 250
	Sleep, 100
	Send, {LButton Up}
	Sleep, 100
	Send, {Ctrl Down}c{Ctrl Up}
 */

Return

ExitApp						; Terminates the script unconditionally


; Labels ==========================================================================================
; =================================================================================================

guiClose:
	ExitApp					; Terminates the script unconditionally


; Functions =======================================================================================
; =================================================================================================


; Classes =========================================================================================
; =================================================================================================


; Hotkeys =========================================================================================
; =================================================================================================

+^z::
	Pause					; Shift-Ctrl-z ---> Pauses the script's current thread
	Return

+^x::
	Send, {Alt Up}
	Send, {Ctrl Up}
	Send, {Shift Up}
	ExitApp					; Shift-Ctrl-x ---> Terminates the script unconditionally

; AHK Script Template 20180820-092738