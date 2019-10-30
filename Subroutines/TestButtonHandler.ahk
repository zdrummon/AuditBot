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