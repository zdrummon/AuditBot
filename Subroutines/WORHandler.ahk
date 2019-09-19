;parse and fulfill audits that need correction

getWORNote() {
	InputBox, WORNote, WOR Note, Please enter the note
	WORNote := "WOR - " . WORNote
}

updateNotesWOR() {

	getWORNote()

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