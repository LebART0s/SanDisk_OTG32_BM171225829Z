#SingleInstance Force        ; Reloads and replaces the current script without confirmation

strPathnFilenameXLS:= A_WorkingDir . "\PCSOResult.xlsx"

Try objExcel := ComObjActive("Excel.Application")

Catch {
    MsgBox, Creating Excel
	objExcel := ComObjCreate("Excel.Application")
	objExcel.Workbooks.Open(strPathnFilenameXLS)
	objExcel.Sheets("6 58 Stat").Select
	objExcel.Visible := 1
}

Return

ExitApp                      ; Terminates the script unconditionally

; Labels ========================================

; Hotkeys =======================================

+^x::ExitApp     ; Shift-Ctrl-x ---> Terminates the script unconditionally
+^z::Pause       ; Shift-Ctrl-z ---> Pauses the script's current thread

; AHK Script Template 20180820-092738