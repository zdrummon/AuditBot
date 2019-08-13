;complete the audit

#include Subroutines\NoteHandler.ahk
#include Subroutines\ShipToHandler.ahk
#include Subroutines\JobDetailHandler.ahk
#include Subroutines\GUIReaderHandler.ahk
#include Subroutines\WORHandler.ahk
#include Subroutines\TestButtonHandler.ahk

Audit(AuditType) {
	CoordMode, Mouse, Window
	
	if (AuditType = "WOR") {
		updateNotesWOR()
		updateBuilding(AuditType)
	} else if (AuditType = "TestButton") {
		activateTestButton()
	} else {
		updateNotes()
		updateBuilding(AuditType)
		updateStatus(AuditType)
	}
	
	if (AuditType = "TestButton") {
		
	} else {
		;close order
		Logger("closing", "order")
		Sleep, 1000
		Click, 1250, 10

		Logger(AuditType, "audit complete")
		MsgBox % AuditType . " audit completed"
	}
}