;target rollmaster

#Include Subroutines\AuditHandler.ahk
#Include Subroutines\OrderHandler.ahk
#Include Subroutines\RMHandler.ahk

AuditRoute(AuditType) {
	RMActive := WinActive("Order Maintenance")
	OrderOpen := WinExist("Order Maintenance")
	RMOpen := WinExist("ahk_class AcucobolWClass")

	if (TestMode) {
		Logger("Test", "running")
		
	} else if (RMActive) {
		Logger("RollMaster", "active")
		Audit(AuditType)

	} else if (OrderOpen) {
		WinActivate, ahk_class AcucobolWClass 
		Logger("RollMaster", "set to active")
		Audit(AuditType)

	} else if (RMOpen) {
		Logger("RollMaster", "order not open")
		OpenOrder(AuditType)
	
	} else {
		Logger("RollMaster", "not open")
		OpenRollMaster(AuditType)
	}
}