; August 22, 2018

; Initail Script Setup ============================================================================
; =================================================================================================

#SingleInstance Force			; Reloads and replaces the current script without confirmation

#NoEnv							; Recommended for performance and compatibility with future AutoHotkey releases.
								; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).

;SetWorkingDir, C:\Users\Public\Public AHK

SetWorkingDir, %A_ScriptDir%	; Ensures a consistent starting directory.

SendMode Input					; Recommended for new scripts due to its superior speed and reliability.

SetCapsLockState Off			; Sets the state of the CapsLock

SetNumLockState On				; Sets the state of the NumLock

SetScrollLockState Off			; Sets the state of the ScrollLock

SetMouseDelay, 10				; Sets the delay that will occur after each mouse movement or click.

SetDefaultMouseSpeed, 2			; Sets the mouse speed that will be used if unspecified in Click and MouseMove/Click/Drag.

SetKeyDelay, 10					; Sets the delay that will occur after each keystroke sent by Send and ControlSend.

SetWinDelay, 100				; Sets the delay that will occur after each windowing command, such as WinActivate

SetBatchLines, 10ms				; Determines how fast a script will run (affects CPU utilization).

SetControlDelay, 20				; Sets the delay that will occur after each control-modifying command.

;#InstallKeybdHook				; For Debugging

;#InstallMouseHook				; For Debugging


; Global Variable Declaration =====================================================================
; =================================================================================================

; Working Files
strAHKFilename1 := A_WorkingDir . "\EuroMillionsFinancialTask.ahk"
strAHKFilename2 := A_WorkingDir . "\EuroMillionsGameTask.ahk"
strXLSFilename  := A_WorkingDir . "\PCSOResult.xlsx"
strTXTFilename  := A_WorkingDir . "\Data\PCSOData.txt"
strCVSFilename1 := A_WorkingDir . "\Data\EuroMillionsFinancialData.csv"
strCVSFilename2 := A_WorkingDir . "\Data\EuroMillionsGameData.csv"

intCntr01 := 0					; Integer variable for counter


; Main Script =====================================================================================
; =================================================================================================

	IfWinExist Notepad++
	{
		WinActivateBottom, Notepad++
	}
	Else
	{
		Run "C:\Program Files\Notepad++\notepad++.exe" %strAHKFilename2%
		Sleep, 100
		Run "C:\Program Files\Notepad++\notepad++.exe" %strCVSFilename2%
		Sleep, 100
	}


; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; Date Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	; Highlight all Data after Headers
	Send, {Ctrl Down}{Home}{Ctrl Up}
	Sleep, 100
	Send, {Down}
	Sleep, 100
	Send, {Shift Down}{Ctrl Down}{End}{Ctrl Up}{Shift Up}
	Sleep, 100

	; Search and Replace Setup
	Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
	Sleep, 100
	Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
	Sleep, 100
	Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
	Sleep, 100

	; Search and Replace
	Send, -{Tab}*					; Change Delimiters on the dates
	Sleep, 100
	Send, {Alt Down}a{Alt Up}		; Replace All
	Sleep, 100

; Date Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	Send, {Escape 2}				; Exit out of Search and Replace
	Sleep, 100

	Send, {Ctrl Down}{home}{Ctrl Up}		; Control+Home - Go to the top most part of the Text Data File
	Sleep, 100
;	Send, {Up}
;	Sleep, 100

; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; Data Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	; Search and Replace Setup
	Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
	Sleep, 100
	Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
	Sleep, 100
	Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
	Sleep, 100

	; Search and Replace Delimeters (;)
	Send, {SC027}{Tab}\t
	Sleep, 100
	Send, {Alt Down}a{Alt Up}		; Replace All
	Sleep, 100

	; Search and Replace Delimeters (,)
	Send, {SC033}{Tab}{SC034}
	Sleep, 100
	Send, {Alt Down}a{Alt Up}		; Replace All
	Sleep, 100

; Data Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


	Send, {Escape 2}				; Exit out of Search and Replace
	Sleep, 100


; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; Month & Day Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	; Select/Highlight the column of month part of the date
	Send, {Down}
	Sleep, 100
	Send, {Right 3}
	Sleep, 100
	Send, {Shift Down}{Alt Down}
	Sleep, 100
	Send, {PgDn 35}
	Sleep, 100
	Send, {Up}
	Sleep, 100
	Send, {Right 3}
	Sleep, 100
	Send, {Alt Up}{Shift Up}
	Sleep, 100
	Clipboard =						; Clear Clipboard
	Sleep, 100
	ClipWait, 1
	Sleep, 100
	Send, {Ctrl Down}x{Ctrl Up}		; Cut
	Sleep, 100
	ClipWait, 1
	Sleep, 100

	Send, {Ctrl Down}{Home}{Ctrl Up}	; Control+Home - Go to the top most part of the Text Data File
	Sleep, 100
    Send, {Down}
	Sleep, 100
	Send, {Ctrl Down}v{Ctrl Up}		; Paste
	Sleep, 100

; Month & Day Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; Date Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	; Highlight all Data after Headers
	Send, {Ctrl Down}{Home}{Ctrl Up}
	Sleep, 100
	Send, {Down}
	Sleep, 100
	Send, {Shift Down}{Ctrl Down}{End}{Ctrl Up}{Shift Up}
	Sleep, 100

	Send, {Ctrl Down}h{Ctrl Up}		; Activate Search and Replace Ctrl+H
	Sleep, 100
	Send, {Alt Down}x{Alt Up}		; Set Search Mode to Extended
	Sleep, 100
	Send, {Alt Down}f{Alt Up}		; Return to Find What Textbox
	Sleep, 100
	Send, *{Tab}/					; Change Delimiters on the dates
	Sleep, 100
	Send, {Alt Down}a{Alt Up}		; Replace All
	Sleep, 1000

	Send, {Escape 2}				; Exit out of Search and Replace
	Sleep, 100

; Date Processing * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	Send, {Ctrl Down}{Home}{Ctrl Up}	; Control+Home - Go to the top most part of the Text Data File
	Sleep, 100
	Send, {Ctrl Down}a{Ctrl Up}		; Select all
	Sleep, 100
	Clipboard =						; Clear Clipboard
	Sleep, 100
	ClipWait, 1
	Sleep, 100
	Send, {Ctrl Down}c{Ctrl Up}		; Copy
	ClipWait, 1
	Sleep, 100
;	Send, {Ctrl Down}w{Ctrl Up}		; Close Working Text File - EuroMillionsFinancialData.csv
;	Sleep, 100
;	Send, n

; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; Start of Excel Data Pprocessing Procedure * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	objExcel := ComObjCreate("Excel.Application")	; Activate Excel application for data processing
	objExcel.Workbooks.add
	objExcel.Visible := 1							; Show Excel Application on screen
	objExcel.Sheets("Sheet1").Select
	objExcel.Range("A1").Select
	Sleep, 100
	Send, {Ctrl Down}v{Ctrl Up}		; Paste
	Sleep, 100

    objExcel.Columns("B:AC").Select
    objExcel.Selection.Style := "Comma"
    objExcel.Range("B:B,D:D,F:F,H:H,J:J,L:L,N:N,P:P,R:R,T:T,V:V,X:X,Z:Z,AB:AB").Select
    objExcel.Selection.NumberFormat := "_(* #,##0_);_(* (#,##0);_(* ""-""??_);_(@_)"

	objExcel.Cells.Select							; Select entire sheet
;    objExcel.Range("A1:XFD1048576").Select
	objExcel.Selection.Font.Name := "Consolas"
	objExcel.Selection.Font.Size := 10

/*     objExcel.Selection.Sort.SortFields.Clear
	objExcel.Selection.Sort.SortFields.Add Key:=Range("A2:A1140" )
	objExcel.Selection.Sort.SetRange Range("A1:AC1140")
    objExcel.Selection.Sort.Header := xlYes
    objExcel.Selection.Sort.MatchCase := False
    objExcel.Selection.Sort.Orientation := xlTopToBottom
    objExcel.Selection.Sort.SortMethod := xlPinYin
    objExcel.Selection.Sort.Apply */

	objExcel.Cells.EntireColumn.AutoFit

; End of Excel Data Pprocessing Procedure * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

	Return

ExitApp								; Terminates the script unconditionally


; Labels ==========================================================================================
; =================================================================================================

guiClose:
     ExitApp						; Terminates the script unconditionally


; Functions =======================================================================================
; =================================================================================================


; Classes =========================================================================================
; =================================================================================================


; Hotkeys =========================================================================================
; =================================================================================================

+^z::
	Pause							; Shift-Ctrl-z ---> Pauses the script's current thread
	Return

+^x::
	Send, {Alt Up}
	Send, {Ctrl Up}
	Send, {Shift Up}
	ExitApp							; Shift-Ctrl-x ---> Terminates the script unconditionally

; AHK Script Template 20180820-092738