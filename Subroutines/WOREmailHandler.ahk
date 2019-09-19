SendEmail() {    
    
    NN := "Static3"
    ControlGetText, OrderNumber, %NN%

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
	BranchInitial := SubStr(BranchInitial, 4, 2)

	BranchOrder := BranchInitial . "-" . OrderNumber

	NN := "ComboBox2"
	ControlGetText, SalesRep, %NN%
	SalesRep := SubStr(SalesRep, 5)
	RepEmail := StrReplace(SalesRep, A_Space) . "@sgcarpet.com"

	InputBox, WOREmail, WOREmail, Good day %SalesRep%`,`n`nI have some questions about this order.`n`nENTER TEXT HERE.`n`nPlease advise.
	global WORNote := WOREmail
	WOREmail := "Good day " . SalesRep . ",`n`nI have some questions about this order. " . WOREmail . " Please advise."

	WinActivate, ahk_class MozillaWindowClass 

    if (BranchInitial == "SA") {
        BranchManagerEmail1 := "jamesjordan@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "AL") {
        BranchManagerEmail1 := "gabriellaferrari@sgcarpet.com"
        BranchManagerEmail2 := "pattismith@sgcarpet.com"
    } else if (BranchInitial == "CU") {
        BranchManagerEmail1 := "matthewgruszie@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "FR") {
        BranchManagerEmail1 := "claudiahalene@sgcarpet.com"
        BranchManagerEmail2 := "fremont@sgcarpet.com"
    } else if (BranchInitial == "PH") {
        BranchManagerEmail1 := "bryandias@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "PL") {
        BranchManagerEmail1 := "jenniferflaming@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "RC") {
        BranchManagerEmail1 := "billkavanaugh@sgcarpet.com"
        BranchManagerEmail2 := "christinaratajczak@sgcarpet.com"
    } else if (BranchInitial == "RK") {
        BranchManagerEmail1 := "damonthompson@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "EG") {
        BranchManagerEmail1 := "robertjennings@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "CN") {
        BranchManagerEmail1 := "thomasheinritz@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "CS") {
        BranchManagerEmail1 := "nathanheiner@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "CC") {
        BranchManagerEmail1 := "sergiocortes@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else {
        ;WE HAVE A BRANCH ERROR
    }
 
    if (RepEmail == "NULLTEST") {
        RepEmail := "NULLTEST@sgcarpet.com"
    } else if (RepEmail == "NULLTEST2") {
        RepEmail := "NULLTEST@sgcarpet.com"
    } else {
        ;EMAIL IS FINE
    }

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

	;click CC
	Logger("clicking", "CC")
	Sleep, 1000
	Click, 670, 260

    ;CCs here
    ;type nick and scheduling email
	Logger("typing", "nicks email and schedulings email")
	Sleep, 1000
	Send nickratajczak@sgcarpet.com 
    Sleep, 1000
   	Send {Enter}
    Send scheduling@sgcarpet.com 
    Sleep, 1000
	Send {Enter}

    ;type managers email 1
	Logger("typing", "managers email")
	Sleep, 1000
	Send %BranchManagerEmail1%
	Sleep, 1000
	Send {Enter}

    ;type managers email 2
	Logger("typing", "managers email")
	Sleep, 1000
	Send %BranchManagerEmail2%
	Sleep, 1000
	Send {Enter}

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