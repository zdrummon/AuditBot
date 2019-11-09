;respond to the test button

activateTestButton() {

    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    OrderNumber := SubStr(OrderNumber, 1, 6)

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
	BranchInitial := SubStr(BranchInitial, 4, 2)
	BranchOrder := BranchInitial . "-" . OrderNumber

	WinActivate, ahk_class Order Maintenance

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

	NN := "Edit1"
	ControlGetText, ProjNum, %NN%
	if (ProjNum != "") {
        ProjNum := "(PROJECT " . ProjNum . ")"
    }

	Logger("customer " . CustFirstName . " " . CustLastName, ProjNum)

	NN := "ListBox1"
	ControlGet, LineItemList, List, , %NN%
	LineItemList := StrReplace(LineItemList, "  ", "")
	LineItemList := StrReplace(LineItemList, Chr(01), ", ")

	WinActivate, ahk_class Notepad
	;type list contents
	Logger("typing", "line items")
	Sleep, 1000
	Send %LineItemList%

	Logger(AuditType, "test " . BranchOrder . " complete")
}