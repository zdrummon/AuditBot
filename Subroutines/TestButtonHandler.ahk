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

	Logger(AuditType, "audit " . BranchOrder . " complete")
}