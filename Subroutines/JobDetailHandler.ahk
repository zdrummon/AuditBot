;update and change the job status

updateStatus(AuditType) {
	;click job detail
	Logger("clicking", "job detail")
	Sleep, 1000
	Click, 300, 320

	;click job status
	Logger("clicking", "job status")
	Sleep, 1000
	Click, 310, 350

	;set job status
	Sleep, 1000
	if(AuditType = "local" or AuditType = "transfer") {
		Logger("clicking", "material received")
		Click, 255, 440

	} else {
		Logger("clicking", "audited")
		Click, 255, 400	
	}
}