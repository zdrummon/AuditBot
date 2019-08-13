;respond to the test button

activateTestButton() {
    NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    TrimmedOrderNumber = %OrderNumber%

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
    TrimmedBranchInitial = %BranchInitial%
    
	Logger(AuditType, "audit " . TrimmedBranchInitial . "-" . TrimmedOrderNumber . " complete")
}