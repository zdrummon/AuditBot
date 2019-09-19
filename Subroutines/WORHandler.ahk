;parse and fulfill audits that need correction

#include Subroutines\WOREmailHandler.ahk

updateNotesWOR() {

	SendEmail()

	WORNote := "WOR - " . WORNote

	WinActivate, ahk_class AcucobolWClass 
	
	;click notes
	Logger("clicking", "notes")
	Sleep, 1000
	Click, 350, 100
	
	;type WOR
	Logger("typing", WORNote)
	Sleep, 1000
	Send %WORNote%

	;click save	
	Logger("clicking", "save")
	Sleep, 1000
	Click, 780, 230
	
	;click exit
	Logger("clicking", "exit")
	Sleep, 1000
	Click, 780, 500	
}