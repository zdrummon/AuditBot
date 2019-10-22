;update and change the job status

#include Subroutines\JobInquiryKiller.ahk

updateStatus(AuditType) {

	Sleep, 1000
	KillJIS()

	;click job detail
	Logger("clicking", "job detail")
	Sleep, 1000
	Click, 300, 320
	KillJIS()

	;click job status
	Logger("clicking", "job status")
	Sleep, 1000
	Click, 310, 350
	KillJIS()

	;set job status
	Sleep, 1000
	if(AuditType = "local" or AuditType = "transfer") {
		Logger("clicking", "material received")
		Click, 255, 440
		KillJIS()

	} else {
		Logger("clicking", "audited")
		Click, 255, 400	
		KillJIS()
	}
}