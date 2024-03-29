;description

#include Subroutines\GUILayouts.ahk
#include Subroutines\WindowResponseHandler.ahk
	
GUIReader() {
	Logger("GUIHandler", "has been called.")
	PixelX := 435
	PixelY := 146
	PixelColorExpected := 0xF9F1EB
	PixelGetColor, PixelColorResult, PixelX, PixelY
	Logger("the color is", PixelColorResult . " at (" . PixelX . ", " . PixelY . ")")
	while (PixelColorExpected != PixelColorResult) {
		Logger("the color should be", PixelColorExpected)
		Logger("the color is still", PixelColorResult . " at (" . PixelX . ", " . PixelY . ")")
		PixelGetColor, PixelColorResult, PixelX, PixelY
		sleep, 1000
	}
	Logger(PixelColorExpected . " matches", PixelColorResult)
}