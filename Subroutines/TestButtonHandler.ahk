;respond to the test button

activateTestButton() {

    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    OrderNumber := SubStr(OrderNumber, 1, 6)

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
	BranchInitial := SubStr(BranchInitial, 4, 2)
	BranchOrder := BranchInitial . "-" . OrderNumber

	NN := "ComboBox2"
	ControlGetText, SalesRep1, %NN%
	SalesRep := SubStr(SalesRep, 5)
    StringLower, SalesRep, SalesRep, T
	RepEmail := StrReplace(SalesRep, A_Space) . "@sgcarpet.com"

	NN := "ComboBox3"
	ControlGetText, SalesRep2, %NN%
	Logger("getting", SalesRep2)
	SalesRep2 := SubStr(SalesRep2, 5)
	Logger("cutting down to", SalesRep2)
    StringLower, SalesRep2, SalesRep2, T
	Logger("finishing cutting down", SalesRep2)
	RepEmail2 := StrReplace(SalesRep2, A_Space) . "@sgcarpet.com"

	;type rep2 email
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
		WinActivate, ahk_class Notepad
	    Send %RepEmail2%
        Sleep, 800
	    Send {Enter}
        Sleep, 550
	}

	NN := "Static40"
	ControlGetText, CustName, %NN%
	CustLastName := SubStr(CustName, 1, InStr(CustName, " "))
	CustLastName := SubStr(CustLastName, 1, InStr(CustLastName, ",") - 1)
	CustFirstName := SubStr(CustName, InStr(CustName, " ", false, , 1) + 1, InStr(CustName, " ", false, , 2) - 1) . " "
	CustFirstName := SubStr(CustFirstName, 1, InStr(CustFirstName, " ") - 1)
	StringLower, CustLastName, CustLastName, T
	StringLower, CustFirstName, CustFirstName, T
	Logger("customer:", CustFirstName . " " . CustLastName . "!")

    NN := "Edit1"
	ControlGetText, ProjNum, %NN%
	Logger("typing", ProjNum)	
	;project num needs to trim spaces, pound signs, and letters

	;NN := "ListBox1"
	;ControlGetText, LineItemList, %NN%

	;WinActivate, ahk_class Notepad
	;type reps name
	;Logger("typing", "line items")
	;Sleep, 1000
	;Send %LineItemList%

	Logger(AuditType, "test " . BranchOrder . " complete")
}