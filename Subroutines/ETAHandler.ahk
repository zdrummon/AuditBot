;calculate next transfer ETA

NextTransferCalculator() {

	;find next transfer
	FormatTime, DayOfWeek, , WDay	
	OffsetETA := 1
	if (DayOfWeek = 1 or DayOfWeek = 3 or DayOfWeek = 5) {
		OffsetETA := 2	
	} else if (DayOfWeek = 7) {
		OffsetETA := 3
	}
	Logger("days til next delivery:", OffsetETA)

	;find current days in the month
	if (A_MM = "01" or A_MM = "03" or A_MM = "05" or A_MM = "07" or A_MM = "08" or A_MM = "10" or A_MM = "12") {
		DaysInMonth := 31
	} else if (A_MM = "04" or A_MM = "06" or A_MM = "09" or A_MM = "11") {
		DaysInMonth := 30
	} else if (A_MM = "02" and Mod(A_YYYY, 100) = 1) {
		DaysInMonth := 29
	} else {
		DaysInMonth := 28
	}
	Logger(DaysInMonth, "days in the month")
	
	;calculate ETA
	if (A_DD + OffsetETA > DaysInMonth) {
		ETADay := A_DD + OffsetETA - DaysInMonth
		ETAMonth := A_MM + 1
		;quick fix for ETA month single digit formatting
		if (ETAMonth < 10) {
			ETAMonth := "0" . ETAMonth
			Logger(ETAMonth, "is the corrected ETAMonth formatting")
		}
	} else {
		ETADay := A_DD + OffsetETA
		ETAMonth := A_MM
	}
	
	;quick fix for ETA day single digit formatting 
	if (ETADay < 10) {
		ETADay := "0" . ETADay
		Logger(ETADay, "is the corrected ETADay formatting")
	}
	
	;format and return ETA
	NextTransfer := ETAMonth . "/" . ETADay
	Logger("Next Transfer on", NextTransfer)
	return NextTransfer
}