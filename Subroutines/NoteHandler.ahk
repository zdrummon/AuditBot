;add AUDITED to the order notes

#include Subroutines\JobInquiryKiller.ahk

updateNotes() {
	;click notes
	Logger("clicking", "notes")
	Sleep, 1000
	Click, 350, 100
	KillJIS()

	;type AUDITED
	Logger("typing", "AUDITED")
	Sleep, 1000
	Send AUDITED

	;click save	
	Logger("clicking", "save")
	Sleep, 1000
	Click, 780, 230
	KillJIS()
	
	;click exit
	Logger("clicking", "exit")
	Sleep, 1000
	Click, 780, 500
	KillJIS()
}
