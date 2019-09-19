;respond to the test button

activateTestButton() {

	WinActivate, ahk_class MozillaWindowClass 

    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    TrimmedOrderNumber = %OrderNumber%

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
    TrimmedBranchInitial = %BranchInitial%
	TrimmedBranchInitial := SubStr(TrimmedBranchInitial, 4, 2)

	BranchOrder := TrimmedBranchInitial . "-" . TrimmedOrderNumber

	;click firefox tab
	Logger("clicking", "outlook")
	Sleep, 1000
	Click, 20, 20

	;click new message
	Logger("clicking", "new message")
	Sleep, 1000
	Click, 110, 150

	;click To field
	Logger("clicking", "To field")
	Sleep, 1000
	Click, 700, 210

	;type NIC
	Logger("typing", "nickratajczak@sgcarpet.com")
	Sleep, 1000
	Send nickratajczak@sgcarpet.com
	Sleep, 1000
	Send {Enter}

	;click nicholas
	Logger("clicking", "nicholas")
	Sleep, 1000
	;Click, 700, 255

	;click subject line
	Logger("clicking", "subject line")
	Sleep, 1000
	Click, 600, 320

	;type I MADE A BUTTON THAT SENDS YOU EMAILS
	Logger("typing", "I MADE A BUTTON THAT SENDS YOU EMAILS")
	Sleep, 1000
	Send I MADE A BUTTON THAT SENDS YOU EMAILS

	;click send
	Logger("clicking", "send")
	Sleep, 1000
	;Click, 605, 700

	Logger(AuditType, "audit " . BranchOrder . " complete")
}