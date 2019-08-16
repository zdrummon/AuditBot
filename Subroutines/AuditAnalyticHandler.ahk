; tallies and calculates stats based on audit output

DailyTally() {
	AuditCount := AuditCount + 1
	Logger("audit number", AuditCount . " for " . A_MM . "/" . A_DD)
}