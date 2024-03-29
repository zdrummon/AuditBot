SendEmail() {    
    
    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    OrderNumber := SubStr(OrderNumber, 1, 6)

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
	BranchInitial := SubStr(BranchInitial, 4, 2)
	BranchOrder := BranchInitial . "-" . OrderNumber

	NN := "ComboBox2"
	ControlGetText, SalesRep1, %NN%
	SalesRep1 := SubStr(SalesRep1, 5)
    StringLower, SalesRep1, SalesRep1, T
	RepEmail1 := StrReplace(SalesRep1, A_Space) . "@sgcarpet.com"
    RepName1 := SubStr(SalesRep1, 1, InStr(SalesRep1, " ") - 1)

    NN := "ComboBox3"
	ControlGetText, SalesRep2, %NN%
	SalesRep2 := SubStr(SalesRep2, 5)
    StringLower, SalesRep2, SalesRep2, T
	RepEmail2 := StrReplace(SalesRep2, A_Space) . "@sgcarpet.com"

	NN := "Static40"
	ControlGetText, CustName, %NN%
    if (InStr(CustName, " ,"))
    {
        CustName := StrReplace(CustName, " ,", ",")
    }
	CustLastName := SubStr(CustName, 1, InStr(CustName, " "))
	CustLastName := SubStr(CustLastName, 1, InStr(CustLastName, ",") - 1)
	CustFirstName := SubStr(CustName, InStr(CustName, " ", false, , 1) + 1, InStr(CustName, " ", false, , 2) - 1) . " "
	CustFirstName := SubStr(CustFirstName, 1, InStr(CustFirstName, " ") - 1)
	StringLower, CustLastName, CustLastName, T
	StringLower, CustFirstName, CustFirstName, T
    ;needs to add plurals to customer/customers
    ;uncapitalize the word And
    ;customer name splitting with /

    NN := "Edit1"
	ControlGetText, ProjNum, %NN%
    if (ProjNum != "") {
        ProjNum := "(PROJECT " . ProjNum . ")"
    }

    GreetingTime := "day"
	if (A_Hour < 12) {
        GreetingTime := "morning"
    } else if (A_Hour < 17) {
        GreetingTime := "afternoon"
    } else {
        GreetingTime := "evening"
    }

	InputBox, WOREmail, Send email describing error, Good %GreetingTime% %RepName1%`,`nThis order needs a bit more attention. Please advise and thank you`, %RepName1%.`n(please type full sentences)
	global WORNote := WOREmail
	WOREmail := "Good " 
        . GreetingTime 
        . " " 
        . RepName1 
        . ",`n`nThis order for your customer "
        . CustFirstName
        . " "
        . CustLastName
        . " needs a bit more attention. " 
        . WOREmail 
        . " Please advise and thank you, " 
        . RepName1 
        . ".`n`n(Please use reply all when responding to this email)"

	WinActivate, ahk_class MozillaWindowClass 

    if (BranchInitial == "SA") {
        BranchManagerEmail1 := "jamesjordan@sgcarpet.com"
        BranchManagerEmail2 := "misaelmunoz@sgcarpet.com"
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
        BranchManagerEmail2 := "shannonjorzig@sgcarpet.com"
    } else if (BranchInitial == "EG") {
        BranchManagerEmail1 := "robertjennings@sgcarpet.com"
        BranchManagerEmail2 := "mattaxford@sgcarpet.com"
    } else if (BranchInitial == "CN") {
        BranchManagerEmail1 := "thomasheinritz@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "CS") {
        BranchManagerEmail1 := "nathanheiner@sgcarpet.com"
        BranchManagerEmail2 := ""
    } else if (BranchInitial == "CC") {
        BranchManagerEmail1 := "sergiocortes@sgcarpet.com"
        BranchManagerEmail2 := ""
    }
 
    ;repemail1 exceptions
    if (RepEmail1 == "AliciaMarieGonzales@sgcarpet.com") {
        RepEmail1 := "AliciaG-onzales@sgcarpet.com"
    } else if (RepEmail1 == "JeffLaferriere@sgcarpet.com") {
        RepEmail1 := "JefferyLaferriere@sgcarpet.com"
    } else if (RepEmail1 == "JeffMoran@sgcarpet.com") {
        RepEmail1 := "JeffreyMoran@sgcarpet.com"
    } else if (RepEmail1 == "AlexanderSchneeberg@sgcarpet.com") {
        RepEmail1 := "AlexSchneeberg@sgcarpet.com"
    }

    ;repemail2 exceptions
    if (RepEmail2 == "AliciaMarieGonzales@sgcarpet.com") {
        RepEmail2 := "AliciaG-onzales@sgcarpet.com"
    } else if (RepEmail2 == "JeffLaferriere@sgcarpet.com") {
        RepEmail2 := "JefferyLaferriere@sgcarpet.com"
    } else if (RepEmail2 == "JeffMoran@sgcarpet.com") {
        RepEmail2 := "JeffreyMoran@sgcarpet.com"
    } else if (RepEmail2 == "AlexanderSchneeberg@sgcarpet.com") {
        RepEmail2 := "AlexSchneeberg@sgcarpet.com"
    }

	;click firefox tab
	Logger("typing", "ctrl + 1 to open outlook tab")
	Sleep, 1000
	Send {CtrlDown}1{CtrlUp}
    Sleep, 550

	;click new message
	Logger("clicking", "new message")
	Sleep, 1000
	Click, 110, 150

	;click To field
	Logger("clicking", "To field")
	Sleep, 1000
	Click, 700, 210
    Sleep, 550

	;type rep1 email
	Logger("typing", RepEmail1)
	Send %RepEmail1%
    Sleep, 800
	Send {Enter}
    Sleep, 550

	;tabbing to CC
	Logger("tabbing to", "CC")
    Send {tab}
    Sleep, 550
    Send {tab}
    Sleep, 550
    Send {tab}
    Sleep, 550

    if (RepEmail2 = "*@sgcarpet.com")
	{
		Logger("no second rep", "selected")
	}
	else if (RepEmail2 = "NotMeasured@sgcarpet.com")
	{
		Logger("no second rep", "selected")
	}
	else
	{
	    Logger("typing", RepEmail2)
	    Send %RepEmail2%
        Sleep, 800
	    Send {Enter}
        Sleep, 550
	}

    ;type nick and scheduling email
	Logger("typing", "nicks email and schedulings email")
	Send nickratajczak@sgcarpet.com 
    Sleep, 550
   	Send {Enter}
    Sleep, 550
    Send scheduling@sgcarpet.com 
    Sleep, 550
	Send {Enter}
    Sleep, 550

    ;type managers email 1
	Logger("typing", "managers email")
	Send %BranchManagerEmail1%
    Sleep, 800
	Send {Enter}
    Sleep, 800

    ;type managers email 2
    if (BranchManagerEmail2 != "")
    {
	    Logger("typing", "managers email")
	    Send %BranchManagerEmail2%
        Sleep, 800
	    Send {Enter}
        Sleep, 800
    }

	;tabbing to subject line
	Logger("tabbing to", "subject line")
	Send {tab}
    Sleep, 800

	;type subject line
	Logger("typing", "AUDIT " . BranchOrder . " project: " . ProjNum)
	Send AUDIT %BranchOrder% %ProjNum%
    Sleep, 550

	;tabbing to email body
	Logger("tabbing to", "email body")
	Send {tab}
    Sleep, 550

	;type reps name
	Logger("typing", "reps name")
	Send %WOREmail%
    Sleep, 550

	;tabbing to send and pressing enter
	Logger("tabbing to", "send and pressing enter")
	Send {tab}
    Sleep, 550
    Send {tab}
    Sleep, 550
    Send {enter}
    Sleep, 550
}