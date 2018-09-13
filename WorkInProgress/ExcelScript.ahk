/*     Script Information
==================================================================================================
 --- AutoHotKey Script for Notepad++ ---
 
 Script Name     : PCSO Excel File Processor
 Description     : PCSO Excel File Processor
 Date Started    : August 10, 2018
 Date Last Edited: August 10, 2018
==================================================================================================
*/

#SingleInstance, Force

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; SetWorkingDir, C:\Users\Public\Public AHK

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetCapsLockState Off

SetScrollLockState Off

SetNumLockState On

SetMouseDelay 100

SetDefaultMouseSpeed 2

/*
   ==================================================================================================
   Global Variable Declaration Goes Here
   ==================================================================================================
*/

obj_excel := ComObjActive("Excel.Application")

/*
   ==================================================================================================
   Global Variable Declaration Ends Here
   ==================================================================================================
*/

/*
   ==================================================================================================
   Main Script Goes Here
   ==================================================================================================
*/

^!q::     ; Alt-Ctrl + q 
    IfWinActive, Microsoft Excel - PCSOResult.xlsx ahk_class XLMAIN ahk_exe EXCEL.EXE
	{
		obj_excel.Sheets("6 58 Stat").Select
		obj_excel.Columns("H:BM").Hidden := False   ;   Unhide Columns

		/*
		obj_excel.Columns("C:F").Select
		obj_excel.Selection.Cut Destination:=Columns("A:D")
		obj_excel.Columns("A:D").Select
		
		obj_excel.Columns("B:D").Select
		obj_excel.Selection.Insert Shift:=xlToRight, CopyOrigin:=xlFormatFromLeftOrAbove
		*/
      
		; DataProcessing here

		obj_excel.Columns("H:BM").Hidden := True   ;   Hide Columns
	}
	Else     ; If Not Active
	{
		MsgBox, 0, Script Warning, Open Datafile PCSOResult.xlsx First
	}
	Return

/*
   ==================================================================================================
   Main Script Ends Here
   ==================================================================================================
*/

/*
   ==================================================================================================
   Functions Goes Here
   ==================================================================================================
*/

/*
   ==================================================================================================
   Functions Ends Here
   ==================================================================================================
*/

ExitApp

^!x::ExitApp     ; Alt-Ctrl-x ---> Terminates the script unconditionally
^!z::Pause     ; Alt-Ctrl-z ---> Pauses the script's current thread

/*
   ==================================================================================================
   Ends Here
   ==================================================================================================
*/


/*
   Other References

  {Alt Down} {Alt Up}
 {Ctrl Down} {Ctrl Up}
{Shift Down} {Shift Up}

===================================================================================================

objExcel := ComObjCreate("Excel.Application")
fle_excel := PCSOResult.xlsx

objExcel := ComObjActive("Excel.Application")
xlBook := objExcel.Workbooks.Open("PCSOResult.xlsx")

xlBook := objExcel.Workbooks.Open(fle_excel)
xlBook.Sheets("6 58 Stat").Select
objExcel.Range("B:BM").Select

===================================================================================================

xlBook.Worksheets("6 58 Stat").Select
objExcel.Columns("H:BM").Hidden := False   ;   Unhide Columns
; DataProcessing here
objExcel.Columns("H:BM").Hidden := True   ;   Hide Columns

xlBook.Worksheets("6 55 Stat").Select
objExcel.Columns("H:BJ").Hidden := False   ;   Unhide Columns
; DataProcessing here
objExcel.Columns("H:BJ").Hidden := True   ;   Hide Columns

xlBook.Worksheets("6 49 Stat").Select
objExcel.Columns("H:BD").Hidden := False   ;   Unhide Columns
; DataProcessing here
objExcel.Columns("H:BD").Hidden := True   ;   Hide Columns

xlBook.Worksheets("6 45 Stat").Select
objExcel.Columns("H:AZ").Hidden := False   ;   Unhide Columns
; DataProcessing here
objExcel.Columns("H:AZ").Hidden := True   ;   Hide Columns

===================================================================================================

objExcel.Columns("H:J").Select
objExcel.Selection.Copy


*/
