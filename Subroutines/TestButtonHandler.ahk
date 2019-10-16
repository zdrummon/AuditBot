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
	ControlGetText, SalesRep, %NN%
	SalesRep := SubStr(SalesRep, 5)
    StringLower, SalesRep, SalesRep, T
	RepEmail := StrReplace(SalesRep, A_Space) . "@sgcarpet.com"

	NN := "ListBox1"
	ControlGetText, LineItemList, %NN%

	WinActivate, ahk_class Notepad

	;type reps name
	Logger("typing", "line items")
	Sleep, 1000
	Send %LineItemList%

	Logger(AuditType, "test " . BranchOrder . " complete")
}