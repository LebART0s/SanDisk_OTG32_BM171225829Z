; Initial Script Setup ============================================================================
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