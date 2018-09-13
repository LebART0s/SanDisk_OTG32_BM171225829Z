/*     Script Information
==================================================================================================
 --- AutoHotKey Script for Notepad++ ---

 Script Name     : PCSO Lotto Data Cleaner
 Description     : Clean PCSO Data Cleaner for Excel Insetion
 Date Started    : August 08, 2018
 Date Last Edited: August 20, 2018 075235hrs
==================================================================================================
 AutoHotKey v1.1.29.01 - June 2, 2018

 Notepad++ Script for PCSO Lotto Result

 #Warn  ; Enable warnings to assist with detecting common errors.

 */

#SingleInstance force

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; SetWorkingDir, C:\Users\Public\Public AHK

SetMouseDelay 100

SetDefaultMouseSpeed 2

SetCapsLockState Off

SetNumLockState On

SetScrollLockState Off

/*

  {Alt Down} {Alt Up}
 {Ctrl Down} {Ctrl Up}
{Shift Down} {Shift Up}

*/

/*
==================================================================================================
   Main Program
==================================================================================================
*/

^!c::     ; Alt-Ctrl + C

	; Search and Replace Setup
	Send {Ctrl Down}h{Ctrl Up}     ; Activate Search and Replace Ctrl+H
	Send {Alt Down}x{Alt Up}     ; Set Search Mode to Extended
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox

	; Search and Replace
	Send -{Tab}\t
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
	Send {Space}{Tab}\t          ; Replace Spaces with Tabs
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
;	Send /{Tab}\t
;	Send {Alt Down}a{Alt Up}     ; Replace All
;	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
	Send \t\t{Tab}\t             ; Replace Double Tabs with Single Tabs
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
	Send Ultra\tLotto\t6/58{tab}Ultra Lotto 6-58
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
	Send Grand\tLotto\t6/55{tab}Grand Lotto 6-55
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
	Send Superlotto\t6/49{tab}Superlotto 6-49
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Alt Down}f{Alt Up}     ; Return to Find What Textbox
	Send Megalotto\t6/45{tab}Megalotto 6-45
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Escape}{Escape}
	Send {Ctrl Down}{home}{Ctrl Up}     ; Control+Home
	Send {Ctrl Down}a{Ctrl Up}     ; Select All
/*

    Columns("H:H").Select
    Selection.Cut
    Columns("B:B").Select
    Selection.Insert Shift:=xlToRight
    Columns("I:I").Select
    Selection.Insert Shift:=xlToRight, CopyOrigin:=xlFormatFromLeftOrAbove
    Cells.Select
    Cells.EntireColumn.AutoFit

*/
	Return

^!v::     ; Alt-Ctrl + V
	Send {Ctrl Down}v{Ctrl Up}     ; Paste from clipboard
	Send {Ctrl Down}h{Ctrl Up}     ; Activate Search and Replace Ctrl+H
	Send \t{Tab}-
	Send {Alt Down}x{Alt Up}     ; Set Search Mode to Extended
	Send {Alt Down}a{Alt Up}     ; Replace All
	Send {Escape}{Escape}
	Send {Ctrl Down}{home}{Ctrl Up}     ; Control+Home
	
	Return

ExitApp

^!x::ExitApp     ; Alt-Ctrl-X ---> Terminates the script unconditionally
