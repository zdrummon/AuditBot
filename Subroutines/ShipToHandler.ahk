;add date and initials to the building line

#include Subroutines\ETAHandler.ahk

updateBuilding(AuditType) {
	;click ship to
	Logger("clicking", "ship to")
	Sleep, 1000
	Click, 190, 320

	;click change location
	Logger("clicking", "change location")
	Sleep, 1000
	Click, 175, 530
	
	;click on building line and select all
	Logger("clicking", "building line")
	Sleep, 1000
	Click, 125, 135
	Logger("select", "all")
	Send, ^a

	;type date and initials
	if (AuditType = "local" or AuditType = "order") {
		Logger("typing", "timestamp and initials")
		Send % A_MM . "/" . A_DD . " ZD"

	} else if (AuditType = "transfer")  {
		NextTransfer := NextTransferCalculator()
		Logger("typing", "ETA")
		Send % "ETA " . NextTransfer . " ZD"	
	} else if (AuditType = "WOR") {
		Send % "WOR " . A_MM . "/" . A_DD . " ZD"
	}

	;click save
	Logger("clicking", "save")
	Sleep, 1000
	Click, 110, 410
}