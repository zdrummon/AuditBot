;ctrl + alt + t to run test mode

^!t::
	if (TestMode = false) {
		TestMode := true
		Logger("test mode" , "activated")
		Logger("type" , "ctrl + alt + q to run")
		MsgBox test mode activated
	} else {
		TestMode := false
		Logger("test mode" , "deactivated")
		MsgBox test mode deactivated
	}
return

^!q::
	if (TestMode = true) {
		TestHub()
	}
return

TestHub() {
	ControlGetText, OutputVar, , Order Maintenance
;	GUIReader()
	MsgBox, % OutputVar
}