/* Autohotkey Script Information ==================================================================
 Script Name        : Minecraft
 Filename           : Minecraft.AHK
 Description        : Script for Modded Minecraft 1.7.10
 Script Version     :
 AHK Version        : v1.1.30.00 - August 22, 2018
 OS Version         :
 Language           : English
 Script Coder       : LebART0s
 License            : 
 Date Started       : 04/04/2017 1814
 Date Last Edited   : 12/17/2018 0213
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

SetDefaultMouseSpeed, 2      ; Sets the mouse speed that will be used if unspecified in Click and MouseMove/Click/Drag. Default mouse speed is 2

SetKeyDelay, 10               ; Sets the delay that will occur after each keystroke sent by Send and ControlSend. Default Delay is -1

SetWinDelay, 100             ; Sets the delay that will occur after each windowing command, such as WinActivate. Default delay is 100

SetBatchLines, 10ms		; Determines how fast a script will run (affects CPU utilization). Default setting is 10ms

SetControlDelay, 20          ; Sets the delay that will occur after each control-modifying command. Default delay is 20

#InstallKeybdHook            ; For Debugging

#InstallMouseHook            ; For Debugging

Menu, Tray, Icon, AHK_Icons\LebART0s_1.ico			; Tray Icon setup

SetNumlockState, AlwaysOn

SetCapsLockState, AlwaysOff

SetScrollLockState, AlwaysOff

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

^#!H::WinHide ahk_class Shell_TrayWnd		;	Hide Taskbar

^#!T::WinShow ahk_class Shell_TrayWnd		;	Show Taskbar

^#8::WinSet, AlwaysOnTop, toggle, A

*/


XButton1::
	If GetKeyState("Rbutton")
		Send {Rbutton Up}
	else
		Send {Rbutton Down}
	Return


XButton2::
	If GetKeyState("Lbutton")
		Send, {Lbutton Up}
	else
		Send, {Lbutton Down}
	Return


#^0::
;	String to type out
;	/give @p diamond_sword 1 0 {ench:[{id:16,lvl:5},{id:17,lvl:5},{id:21,lvl:3},{id:34,lvl:3},{id:70,lvl:1}]}
;	/give @p book 1 0 {display:{Name:"Legendary Book of Slaying",Lore:["The Way Of The Kill"]},ench:[{id:16,lvl:5},{id:17,lvl:5},{id:21,lvl:3},{id:34,lvl:3},{id:70,lvl:1}]}
	Item1 = /give @p diamond_sword 1 0 {ench:[{id:16,lvl:5},{id:17,lvl:5},{id:21,lvl:3},{id:34,lvl:3},{id:70,lvl:1}]}
	Item2 = /give @p diamond_pickaxe 1 0 {ench:[{id:32,lvl:5},{id:34,lvl:3},{id:35,lvl:3},{id:70,lvl:1}]}
	Item3 = /give @p fishing_rod 1 0 {ench:[{id:61,lvl:3},{id:62,lvl:3},{id:34,lvl:3},{id:70,lvl:1}]}
	Item4 = /give @p pumpkin_pie 64

;	The loop to type out the string
	Sleep, 1000
	Loop % StrLen(Item1)
		{
			SendRaw, % SubStr(Item1, A_Index, 1)
		}
	Send, {Enter}
	Loop % StrLen(Item2)
		{
			SendRaw, % SubStr(Item2, A_Index, 1)
		}
	Send, {Enter}
	Loop % StrLen(Item3)
		{
			SendRaw, % SubStr(Item3, A_Index, 1)
		}
	Send, {Enter}
	Loop % StrLen(Item4)
		{
			SendRaw, % SubStr(Item4, A_Index, 1)
		}
	Send, {Enter}
	Sleep, 250
	Send, {F3 down}{D down}
	Sleep, 250
	Send, {F3 up}{D up}
Return


#^1::		;Legendary Book of Slaying
Send, /
Sleep, 250
Send, give @p book 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:16,lvl:5},{id:17,lvl:5},
Sleep, 250
Send,Raw, {id:21,lvl:3},{id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Return


#^2::		;Legendary Book of Mining
Send, /
Sleep, 250
Send, give @p book 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},
Sleep, 250
Send,Raw, {id:35,lvl:3},{id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Return


#^3::		;Legendary Book of Fishing
Send, /
Sleep, 250
Send, give @p book 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:61,lvl:3},{id:62,lvl:3},
Sleep, 250
Send,Raw, {id:34,lvl:3},{id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Return


#^4::		;Book of the Quick
Send, /
Sleep, 250
Send, give @p book 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},
Sleep, 250
Send,Raw, {id:34,lvl:3},{id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Return


#^t::		; Teleport to x0, z0
Send, /
Sleep, 100
Send, gamemode 1{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, tp 0 200 0{Enter}
Sleep, 100
Send, {F3 down}{D down}
Sleep, 100
Send, {F3 up}{D up}
Return


/*
;!^+J::
scrolllock::
Send, /
Sleep, 100
Send, gamemode 1{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_sword{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_pickaxe{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_axe{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_shovel{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_helmet{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_chestplate{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_boots{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p iron_leggings{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p pumpkin_pie 64{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p oak_sapling 16{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p 6:0 16{Enter}
Send, /
Sleep, 100
Send, give @p 6:1 16{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p 6:2 16{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p 6:3 16{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p 6:4 16{Enter}
Sleep, 100
Send, /
Sleep, 100
Send, give @p 6:5 16{Enter}
Sleep, 100
Send, gamemode 0{Enter}
Sleep, 100
Return

  
printscreen::
Sleep 50
Send, /
Sleep 50
Send, give @p diamond_sword 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:16,lvl:5},{id:17,lvl:5},{id:21,lvl:3},
Sleep, 250
Send,Raw, {id:34,lvl:3},{id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p diamond_pickaxe 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},{id:35,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p diamond_axe 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p fishing_rod 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:34,lvl:3},{id:61,lvl:3},{id:62,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p diamond_shovel 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p diamond_hoe 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p shears 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p flint_and_steel 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:32,lvl:5},{id:34,lvl:3},
Sleep, 250
Send,Raw, {id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p pumpkin_pie 64{Enter}
Sleep, 250
Send, /
Sleep, 250
Send, give @p bow 1 0 {space}
Sleep, 250
Send,Raw, {ench:[{id:34,lvl:3},{id:48,lvl:5},
Sleep, 250
Send,Raw, {id:51,lvl:3},{id:70,lvl:1}]}
Sleep, 250
Send, {Enter}
Sleep, 250
Send, {F3 down}{D down}
Sleep, 250
Send, {F3 up}{D up}
Return
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

ExitApp			; Terminates the script unconditionally


+^r::
	Reload		;	Shift + Ctrl + r ---> Reload This Script

+^x::
	ExitApp		;	Shift + Ctrl + x ---> Terminates the script unconditionally

+^z::
	Pause		;	Shift + Ctrl + z ---> Pauses the script's current thread

/*
   ================================================================================================
   Ends Here
   ================================================================================================
*/

 
/*  Revision History / Changelog =================================================================

 Revision Date   : 
 Script Version  : v1.0
 List of Changes :
 
 ===================================================================================================
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

;scrolllock::
;If GetKeyState("Scrolllock")
;   Send, {ScrollLock Up}
;else
;   Send, {ScrollLock Down}
;   Send, ScrollLock Down
;Return

;printscreen::
;If GetKeyState("PrintScreen")
;   Send, {PrintScreen Up}
;else
;   Send, {PrintScreen Down}
;   Send, PrintScreen Down
;Return

;pause::
;If GetKeyState("Pause")
;   Send, {Pause Up}
;else
;   Send, {Pause Down}
;   Send, Pause Down
;Return

;break::
;If GetKeyState("Break")
;   Send, {Break Up}
;else
;   Send, {Break Down}
;   Send, Break Down
;Return
