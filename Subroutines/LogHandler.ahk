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
	LogItem := % A_ScriptName . ": [" A_Hour . ":" . A_Min . ":" . A_Sec . "] " . BranchOrder . " " . LogTarget . " " . LogCode

	if (TestMode = true) {
		OutputDebug, % A_ScriptName . "(test): " . BranchOrder . " " . LogTarget . " " . LogCode
	} else {
		OutputDebug, %LogItem%
		FileAppend, `n %LogItem%, %DailyLogName%
	}
}