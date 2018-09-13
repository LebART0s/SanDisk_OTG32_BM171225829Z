d Lotto 6-55/* Autohotkey Script Information ==================================================================
 Script Name        : My Scraping Script
 Filename           : MyScrapingScript.ahk
 Description        : TestScript For Web Scraping
 Script Version     : v0.0.1
 AHK Version        : v1.1.29.01 - June 2, 2018
 OS Version         : Windows 7
 Language           : English
 Script Coder       : LebART0s
 License            : 
 Date Started       : August 26, 2018
 Date Last Edited   : August 26, 2018
===================================================================================================

 ************************************************************************************************************
 ************************************************************************************************************
 **LL************************************bb***********************AA************RRRRRRRRRRRR*****TTTTTTTTTT**
 **LL************************************bb**********************AAAA***********RR*********RR********TT******
 **LL************************************bb*********************AA**AA**********RR**********RR*******TT******
 **LL****************eeeeeeeee***********bb********************AA****AA*********RR*********RR********TT******
 **LL***************ee*******ee**********bb*******************AA******AA********RRRRRRRRRRRR*********TT******
 **LL**************ee*********ee*********bbbbbbbbbbb*********AAAAAAAAAAAA*******RR******RR***********TT******
 **LL**************eeeeeeeeeeeee*********bb********bb*******AA**********AA******RR*******RR**********TT******
 **LL**************ee********************bb*********bb*****AA************AA*****RR********RR*********TT******
 **LL**************ee*********ee***..****bb********bb*****AA**************AA****RR*********RR********TT******
 **LLLLLLLLLLLLL****eeeeeeeeeee****..****bbbbbbbbbbb*****AA****************AA***RR**********RR*******TT******
 ************************************************************************************************************
 ************************************************************************************************************
 */

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


pwb := WBGet()

MsgBox, % pwb

Return

ExitApp						; Terminates the script unconditionally


; Labels ==========================================================================================
; =================================================================================================

guiClose:
	ExitApp					; Terminates the script unconditionally


; Functions =======================================================================================
; =================================================================================================

;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1)
	{               ;// based on ComObjQuery docs
		static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
			, IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//			, IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
		SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

		if (ErrorLevel != "FAIL")
		{
			lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
			if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0
			{
				DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
				return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
			}
		}
	}
	Return

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

/*  Revision History / Changelog =================================================================

 Revision Date   : 
 Script Version  : v0.1.0
 List of Changes :
 
 ===================================================================================================

 Revision Date   : August 26, 2018
 Script Version  : v0.0.1
 List of Changes : Started Coding this WebScraper
 
 ===================================================================================================
 