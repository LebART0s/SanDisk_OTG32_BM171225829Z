/* Autohotkey Script Information ==================================================================
 Script Name		: PCSO Task
 Filename		: PCSOTask.ahk
 Description		: Script for PCSO Data, arranging data from Text to Excel
 Script Version		: v1.1.000
 AHK Version		: v1.1.29.01 June 2, 2018
 OS Version		: Windows 7
 Language		: English
 Script Coder		: LebART0s
 License		: Creative Commons Attribution Non Commercial Share Alike 3.0
 Date Started		: August 08, 2018
 Date Last Edited	: August 22, 2018
===================================================================================================
Developement Notes:

 * Simplify if possible
 * Add precise and clearly comments

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

; Initail Script Setup ============================================================================
; =================================================================================================

#SingleInstance Force			; Reloads and replaces the current script without confirmation

#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
					; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).

; SetWorkingDir, C:\Users\Public\Public AHK

SetWorkingDir, %A_ScriptDir%		; Ensures a consistent starting directory.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetCapsLockState Off			; Sets the state of the CapsLock
SetNumLockState On			; Sets the state of the NumLock
SetScrollLockState Off			; Sets the state of the ScrollLock
SetMouseDelay, 10			; Sets the delay that will occur after each mouse movement or click.
SetDefaultMouseSpeed, 2			; Sets the mouse speed that will be used if unspecified in Click and MouseMove/Click/Drag.
SetKeyDelay, 10				; Sets the delay that will occur after each keystroke sent by Send and ControlSend.
SetWinDelay, 100			; Sets the delay that will occur after each windowing command, such as WinActivate
SetBatchLines, 10ms			; Determines how fast a script will run (affects CPU utilization).
SetControlDelay, 20			; Sets the delay that will occur after each control modifying command.

#InstallKeybdHook			; For Debugging

#InstallMouseHook			; For Debugging


; Global Variable Declaration =====================================================================
; =================================================================================================

; Working Files
strAHKFilename1 := A_WorkingDir . "\EuroMillionsFinancialTask.ahk"
strAHKFilename2 := A_WorkingDir . "\EuroMillionsGameTask.ahk"
strAHKFilename3 := A_WorkingDir . "\PCSOTask.ahk"
strXLSFilename := A_WorkingDir . "\PCSOResult.xlsx"
strTXTFilename := A_WorkingDir . "\Data\PCSOData.txt"
strCVSFilename1 := A_WorkingDir . "\Data\EuroMillionsFinancialData.csv"
strCVSFilename2 := A_WorkingDir . "\Data\EuroMillionsGameData.csv"

; Main Script =====================================================================================
; =================================================================================================

Send, {LWin Down}d{LWin up}			; Minimize all Winodows

Sleep, 100

Try objExcel := ComObjActive("Excel.Application")

Catch
{
	objExcel := ComObjCreate("Excel.Application")
	objExcel.Workbooks.Open(strXLSFilename)
	objExcel.Sheets("Stats").Select
	objExcel.Visible := True
}

Sleep, 100

IfWinExist ahk_class Notepad++
	{

;		MsgBox True!!!			; for debugging
;		Return

		WinActivateBottom, Notepad++

		Send, {Ctrl Down}{Shift Down}w{Shift Up}{Ctrl Up}			; Activate Search and Replace Ctrl+H

		IfWinExist ahk_class #32770			; Save? Yes/No MsgBox
			{
				Send, n
				Sleep, 100
			}

		Run "C:\Program Files\Notepad++\notepad++.exe" %strAHKFilename3%

		Sleep, 100

		Run "C:\Program Files\Notepad++\notepad++.exe" %strTXTFilename%
	}
	Else
	{
		Run "C:\Program Files\Notepad++\notepad++.exe" %strAHKFilename3%

		Sleep, 100

		Run "C:\Program Files\Notepad++\notepad++.exe" %strTXTFilename%
	}


Sleep, 100

; Notepad++ Data processing section

; Search and Replace Setup
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended

; Search and Replace

Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
Send, -{Tab}\t
Send, {Alt Down}a{Alt Up}		; Replace All
Sleep, 100

Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
Send, {Space}{Tab}\t			; Replace Spaces with Tabs
Send, {Alt Down}a{Alt Up}		; Replace All

Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended

Sleep, 100
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
Send, {Space}{Tab}\t			; Replace Spaces with Tabs
Send, {Alt Down}a{Alt Up}		; Replace All

Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox

Sleep, 100
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
Send, \t\t{Tab}\t			; Replace Double Tabs with Single Tabs
Send, {Alt Down}a{Alt Up}		; Replace All

Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox

Sleep, 100
Send, Ultra\tLotto\t6/58{tab}Ultra Lotto 6 58			; Remove Tabs from this string
Send, {Alt Down}a{Alt Up}		; Replace All

Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox

Sleep, 100
Send, Grand\tLotto\t6/55{tab}Grand Lotto 6 55			; Remove Tabs from this string
Send, {Alt Down}a{Alt Up}		; Replace All

Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox

Sleep, 100
Send, Superlotto\t6/49{tab}Superlotto 6 49			; Remove Tabs from this string
Send, {Alt Down}a{Alt Up}		; Replace All

Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox

Sleep, 100
Send, Megalotto\t6/45{tab}Megalotto 6 45			; Remove Tabs from this string
Send, {Alt Down}a{Alt Up}		; Replace All
Sleep, 100
Send, {Escape}{Escape}			; Exit out of Search and Replace
Sleep, 100
Send, {Ctrl Down}{home}{Ctrl Up}	; Control+Home Go to the top most part of the Text Data File
Sleep, 100
Send, {Ctrl Down}a{Ctrl Up}		; Select All
Sleep, 100
Send, {Ctrl Down}c{Ctrl Up}		; Copy formatted data in Working Text File
Sleep, 100
Send, {Ctrl Down}w{Ctrl Up}		; Close Working Text File PCSOData.txt
Sleep, 100
Send, n
Sleep, 100

; Excel Data processing section
Try
{
	objExcel := ComObjActive("Excel.Application")		; Activate Excel application for data processing
	Sleep, 100
	objExcel.Sheets.Add					; Insert Sheet
	objExcel.ActiveSheet.Paste				; Paste data from Text File PCSOData.txt
	objExcel.Cells.Select					; Select entire sheet
	objExcel.Cells.EntireColumn.AutoFit			; Autofit columns
	objExcel.Columns("H:H").Select				; Select Date columns
	objExcel.Selection.Cut					; Move and insert Date column to diffrent column
	objExcel.Columns("B:B").Select				; Select column for date column to be inserted
	objExcel.Selection.Insert				; Insert Date column and shift columns to the right
	Sleep, 100
	objExcel.Visible := 1					; Show Excel Application on screen
	MsgBox, Data Processing Finished...
}
Catch
{
	MsgBox Something went wrong somewhere!!!		; This will happen when there is no active Excel Application
}

Return


; Labels / SubProcedures ==========================================================================
; =================================================================================================

guiClose:			; Close Button on the Graphical User Interface (GUI)
	ExitApp			; Terminates the script unconditionally


; Functions =======================================================================================
; =================================================================================================


; Classes =========================================================================================
; =================================================================================================


; HotStrings ======================================================================================
; =================================================================================================


; Hotkeys =========================================================================================
; =================================================================================================

+^r::
	Reload			; Reload This Script

+^z::
	Pause			; Shift Ctrl z > Pauses the script's current thread
	Return

+^x::
	ExitApp			; Shift Ctrl x > Terminates the script unconditionally

/* AHK Script Template 20180820 092738 ============================================================

 Revision History / Changelog =====================================================================

 Revision Date : August 23, 2018
 Script Version : v1.1.000
 List of Changes : Consolidated all subprogram into the main program
 Replaced all delay times from 250ms to 100ms (Sleep, 100)
 Adjusted a few comments and a few program statements

 ===================================================================================================

 Revision Date : August 22, 2018
 Script Version : v1.0.005
 List of Changes : Removed Excess comments in the script

 ===================================================================================================
 */
