;complete the audit

#include Subroutines\NoteHandler.ahk
#include Subroutines\ShipToHandler.ahk
#include Subroutines\JobDetailHandler.ahk
#include Subroutines\GUIReaderHandler.ahk
#include Subroutines\WORHandler.ahk
#include Subroutines\TestButtonHandler.ahk
#include Subroutines\AuditAnalyticHandler.ahk

Audit(AuditType) {
	CoordMode, Mouse, Window

	NN := "Static3"
    ControlGetText, OrderNumber, %NN%
    TrimmedOrderNumber = %OrderNumber%

	NN := "msctls_statusbar321"
	ControlGetText, BranchInitial, %NN%
    TrimmedBranchInitial = %BranchInitial%
	TrimmedBranchInitial := SubStr(TrimmedBranchInitial, 4, 2)

	BranchOrder := TrimmedBranchInitial . "-" . TrimmedOrderNumber
	
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
		Logger(AuditType, "audit complete")
		DailyTally()
		Logger("closing", "order")
		Sleep, 1000
		Click, 1250, 10
		MsgBox % AuditType . " audit " . BranchOrder . " completed"
		OutputDebug, AuditBot.ahk: ====================================================================================================
		FileAppend, `n ====================================================================================================, %DailyLogName%
	}
}