;respond to the test button

activateTestButton() {

    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    TrimmedOrderNumber = %OrderNumber%

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
    TrimmedBranchInitial = %BranchInitial%
	TrimmedBranchInitial := SubStr(TrimmedBranchInitial, 4, 2)

	BranchOrder := TrimmedBranchInitial . "-" . TrimmedOrderNumber

	NN := "ComboBox2"
	ControlGetText, SalesRep, %NN%
	SalesRep := SubStr(SalesRep, 5)
	RepEmail := StrReplace(SalesRep, A_Space) . "@sgcarpet.com"

	InputBox, WOREmail, WOREmail, Good day %SalesRep%`,`n`nI have some questions about this order. ENTER TEXT HERE. Please advise.
	WORNote := WOREmail
	WOREmail := "Good day " . SalesRep . ",`n`nI have some questions about this order. " . WOREmail . ". Please advise."

	WinActivate, ahk_class MozillaWindowClass 

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

	;type my email
	Logger("typing", "zacharydrummond@sgcarpet.com")
	Sleep, 1000
	Send zacharydrummond@sgcarpet.com
	Sleep, 1000
	Send {Enter}

	;click zachary
	Logger("clicking", "zachary")
	Sleep, 1000
	;Click, 700, 255

	;click subject line
	Logger("clicking", "subject line")
	Sleep, 1000
	Click, 600, 320

	;type subject line
	Logger("typing", "AUDIT " . BranchOrder)
	Sleep, 1000
	Send AUDIT %BranchOrder%

	;type clicking email body
	Logger("clicking", "email body")
	Sleep, 1000
	Click, 605, 375

	;type reps name
	Logger("typing", "reps name")
	Sleep, 1000
	Send %RepEmail% %WOREmail%

	;click send
	Logger("clicking", "send")
	Sleep, 1000
	Click, 605, 700

	Logger(AuditType, "audit " . BranchOrder . " complete")
}