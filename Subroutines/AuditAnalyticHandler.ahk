; tallies and calculates stats based on audit output

DailyTally() {
	if (LastAuditDay == A_DD) {
		Logger("last audit was completed today on", LastAuditDay)
		AuditCount := AuditCount + 1
	} else if (LastAuditDay == 0) {
		Logger("first audit","since restart")
		AuditCount := AuditCount + 1
		LastAuditDay := A_DD
	} else {
		Logger("last audit was completed previously on the", LastAuditDay)
		AuditCount := 1
		LastAuditDay := A_DD
	}

	Logger("audit number", AuditCount . " at " . A_Hour . ":" . A_Min . " on " . A_MM . "/" . A_DD)
}