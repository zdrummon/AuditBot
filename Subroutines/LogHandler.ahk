;controls dynamic logging to track automation processes

Logger(LogTarget, LogCode) {	

	NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    TrimmedOrderNumber = %OrderNumber%

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
    TrimmedBranchInitial = %BranchInitial%
	TrimmedBranchInitial := SubStr(TrimmedBranchInitial, 4, 2)

	BranchOrder := TrimmedBranchInitial . "-" . TrimmedOrderNumber
	LogItem := % A_ScriptName . ": " . BranchOrder . " " . LogTarget . " " . LogCode

	if (TestMode = true) {
		OutputDebug, % A_ScriptName . "(test): " . BranchOrder . " " . LogTarget . " " . LogCode
	} else {
		OutputDebug, %LogItem%
		DailyLogName := A_MM . "-" . A_DD . "-" . A_YYYY . " audit log"
		FileAppend, `n %LogItem%, C:\Zachary's Experiments\AuditBot\Logs\%DailyLogName%.txt
	}
}