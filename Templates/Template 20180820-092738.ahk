/* Autohotkey Script Information ==================================================================
 Script Name        :
 Filename           :
 Description        :
 Script Version     :
 AHK Version        : v1.1.29.01 - June 2, 2018
 OS Version         :
 Language           :
 Script Coder       : LebART0s
 License            : 
 Date Started       :
 Date Last Edited   :
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

/*
   ================================================================================================
   Script Settings Goes Here
   ================================================================================================
*/

; SetWorkingDir, C:\Users\Public\Public AHK

SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
                             ; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).

#SingleInstance Force        ; Reloads and replaces the current script without confirmation

SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.

SetCapsLockState Off         ; Sets the state of the CapsLock

SetNumLockState On           ; Sets the state of the NumLock

SetScrollLockState Off       ; Sets the state of the ScrollLock

SetMouseDelay, 10            ; Sets the delay that will occur after each mouse movement or click.

SetDefaultMouseSpeed, 2      ; Sets the mouse speed that will be used if unspecified in Click and MouseMove/Click/Drag.

SetKeyDelay, 10              ; Sets the delay that will occur after each keystroke sent by Send and ControlSend.

SetWinDelay, 100             ; Sets the delay that will occur after each windowing command, such as WinActivate

SetBatchLines, 10ms          ; Determines how fast a script will run (affects CPU utilization).

SetControlDelay, 20          ; Sets the delay that will occur after each control-modifying command.

#InstallKeybdHook            ; For Debugging

#InstallMouseHook            ; For Debugging

/*
   ================================================================================================
   Script Settings Ends Here
   ================================================================================================
*/


/*
   ================================================================================================
   Global Variable Declaration Goes Here
   ================================================================================================
*/

/*
   ================================================================================================
   Global Variable Declaration Ends Here
   ================================================================================================
*/


/*
   ================================================================================================
   Main Script Goes Here
   ================================================================================================
*/

/*
   ================================================================================================
   Main Script Ends Here
   ================================================================================================
*/


/*
   ================================================================================================
   Functions Goes Here
   ================================================================================================
*/

/*
   ================================================================================================
   Functions Ends Here
   ================================================================================================
*/

Return

ExitApp                      ; Terminates the script unconditionally

+^r::
	Reload			; Reload This Script

+^x::
	ExitApp     ; Shift-Ctrl-x ---> Terminates the script unconditionally

+^z::
	Pause       ; Shift-Ctrl-z ---> Pauses the script's current thread

/*
   ================================================================================================
   Ends Here
   ================================================================================================
*/



/* ; Miscellaneous Information / Notes

===================================================================================================

  Other References

    {Alt Down} {Alt Up}
   {Ctrl Down} {Ctrl Up}
  {Shift Down} {Shift Up}

AutoHotKey
# - Win
^ - Control
+ - Shift
! - Alt

===================================================================================================

*/

; AHK Script Template 20180820-092738
 
 
/*  Revision History / Changelog =================================================================

 Revision Date   : 
 Script Version  : v1.0
 List of Changes :
 
 ===================================================================================================
 */