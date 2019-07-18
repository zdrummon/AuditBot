;controls dynamic logging to track automation processes

Logger(LogTarget, LogCode) {	
	if (TestMode = true) {
		OutputDebug, % A_ScriptName . "(test): " . LogTarget . " " . LogCode
	} else {
		OutputDebug, % A_ScriptName . ": " . LogTarget . " " . LogCode
	}
}