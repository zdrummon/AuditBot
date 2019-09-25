SendEmail() {    
    
    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    OrderNumber := SubStr(OrderNumber, 1, 6)

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
	BranchInitial := SubStr(BranchInitial, 4, 2)
	BranchOrder := BranchInitial . "-" . OrderNumber

	NN := "ComboBox2"
	ControlGetText, SalesRep, %NN%
	SalesRep := SubStr(SalesRep, 5)
    StringLower, SalesRep, SalesRep, T
	RepEmail := StrReplace(SalesRep, A_Space) . "@sgcarpet.com"

    GreetingTime := "day"

    if (A_Hour < 12) {
        GreetingTime := "morning"
    } else if (A_Hour > 12 && A_Hour < 16) {
        GreetingTime := "afternoon"
    } else {
        GreetingTime := "evening"
    }

	InputBox, WOREmail, Send email describing error, Good %GreetingTime% %SalesRep%`,`nI have some concerns about this order. Please advise.`n(please type full sentences)
	global WORNote := WOREmail
	WOREmail := "Good " . GreetingTime . " " . SalesRep . ",`n`nI have some concerns about this order. " . WOREmail . " Please advise."

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
	Logger("typing", "ctrl + 1 to open outlook tab")
	Sleep, 1000
	Send {CtrlDown}1{CtrlUp}

	;click new message
	Logger("clicking", "new message")
	Sleep, 1000
	Click, 110, 150

	;click To field
	Logger("clicking", "To field")
	Sleep, 1000
	Click, 700, 210

	;type my email
	Logger("typing", RepEmail)
	Send %RepEmail%
	Send {Enter}

	;tabbing to CC
	Logger("tabbing to", "CC")
	Send {tab}{tab}{tab}

    ;type nick and scheduling email
	Logger("typing", "nicks email and schedulings email")
	Send nickratajczak@sgcarpet.com 
   	Send {Enter}
    Send scheduling@sgcarpet.com 
	Send {Enter}

    ;type managers email 1
	Logger("typing", "managers email")
	Send %BranchManagerEmail1%
	Send {Enter}

    ;type managers email 2
	Logger("typing", "managers email")
	Send %BranchManagerEmail2%
	Send {Enter}

	;tabbing to subject line
	Logger("tabbing to", "subject line")
	Send {tab}

	;type subject line
	Logger("typing", "AUDIT " . BranchOrder)
	Send AUDIT %BranchOrder%

	;tabbing to email body
	Logger("tabbing to", "email body")
	Send {tab}

	;type reps name
	Logger("typing", "reps name")
	Send %WOREmail%

	;tabbing to send and pressing enter
	Logger("tabbing to", "send and pressing enter")
	Send {tab}{tab}{enter}
}