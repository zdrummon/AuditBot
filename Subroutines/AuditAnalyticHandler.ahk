; tallies and calculates stats based on audit output

DailyTally() {
	AuditCount := AuditCount + 1
	Logger("audit number", AuditCount . " at " . A_Hour . ":" . A_Min . " on " . A_MM . "/" . A_DD)
}