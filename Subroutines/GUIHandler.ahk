;create graphical user interface

AuditBotGUI() {
	global
	SysGet, Mon, MonitorWorkArea, 1
	SysGet, TitleHeight, 31
	GUIPosX := MonRight - 150 - 5
	GUIPosY := MonBottom - 384 - TitleHeight - 5
	
	Logger("GUI" , "activated")
	Menu, tray, Icon , AuditBotDark.ico, 1, 1
	Gui, AuditBot:New
	Gui -Resize -MaximizeBox +AlwaysOnTop
	Gui, Add, Picture, w150 h-1 x0 y0, C:\Zachary's Experiments\AuditBot\AuditBotSplash.jpg
	Gui, Add, Checkbox, x10 y155 w100 h20 vNotesRead, Notes
	Gui, Add, Checkbox, x10 y175 w100 h20 vDiagramAudited, Diagram
	Gui, Add, Checkbox, x10 y195 w120 h20 vCustomerAgreementAudited, Customer Agreement
	Gui, Add, Checkbox, x10 y215 w120 h20 vLineCommentsAudited, Line Comments
	Gui, Add, Checkbox, x10 y235 w120 h20 vFloorWizardAudited, Charges
	Gui, Add, Checkbox, x10 y255 w120 h20 vMiscAudited, Adhes + Demo
	Gui, Add, Checkbox, x10 y275 w120 h20 vTransitionsAudited, Transitions	
	Gui, Add, Checkbox, x10 y295 w120 h20 vMaterialsAssigned, Materials Assigned
	Gui, Add, Button, default x0 y320 w75 h32 gButtonLocalAudit, &Local audit
	Gui, Add, Button, default x75 y320 w75 h32 gButtonTransferAudit, &Transfer audit
	Gui, Add, Button, default x0 y352 w75 h32 gButtonOrderAudit, &Order audit
	Gui, Add, Button, default x75 y352 w75 h32 gWaitingOnReply, &WOR

	;test button
	Gui, Add, Button, default x120 y155 w25 h25 gTestButton, &T
	;-----------
	
	Gui, Show, % "x" . GUIPosX . " y" . GUIPosY . " w150 h384" , AuditBot
	return
	
	ButtonLocalAudit:
		Gui, Submit, NoHide
		if (NotesRead = 1 and CustomerAgreementAudited = 1 and DiagramAudited = 1 and FloorWizardAudited = 1 and TransitionsAudited = 1 and LineCommentsAudited = 1 and MaterialsAssigned = 1) {
			Logger("local", "audit activated")
			AuditRoute("local")
			GuiControl, , NotesRead, 0
			GuiControl, , CustomerAgreementAudited, 0
			GuiControl, , DiagramAudited, 0
			GuiControl, , FloorWizardAudited, 0
			GuiControl, , TransitionsAudited, 0
			GuiControl, , LineCommentsAudited, 0
			GuiControl, , MiscAudited, 0
			GuiControl, , MaterialsAssigned, 0			
		} else {
			Logger("tasks", "incomplete")
		}
	return
	
	ButtonTransferAudit:
		Gui, Submit, NoHide
		if (NotesRead = 1 and CustomerAgreementAudited = 1 and DiagramAudited = 1 and FloorWizardAudited = 1 and TransitionsAudited = 1 and LineCommentsAudited = 1 and MaterialsAssigned = 1) {
			Logger("transfer", "audit activated")
			AuditRoute("transfer")
			GuiControl, , NotesRead, 0
			GuiControl, , CustomerAgreementAudited, 0
			GuiControl, , DiagramAudited, 0
			GuiControl, , FloorWizardAudited, 0
			GuiControl, , TransitionsAudited, 0
			GuiControl, , LineCommentsAudited, 0
			GuiControl, , MiscAudited, 0
			GuiControl, , MaterialsAssigned, 0			
		} else {
			Logger("tasks", "incomplete")
		}
	return
	
	ButtonOrderAudit:
		Gui, Submit, NoHide
		if (NotesRead = 1 and CustomerAgreementAudited = 1 and DiagramAudited = 1 and FloorWizardAudited = 1 and TransitionsAudited = 1 and LineCommentsAudited = 1 and MaterialsAssigned = 1) {
			Logger("order", "audit activated")
			AuditRoute("order")	
			GuiControl, , NotesRead, 0
			GuiControl, , CustomerAgreementAudited, 0
			GuiControl, , DiagramAudited, 0
			GuiControl, , FloorWizardAudited, 0
			GuiControl, , TransitionsAudited, 0
			GuiControl, , LineCommentsAudited, 0
			GuiControl, , MiscAudited, 0
			GuiControl, , MaterialsAssigned, 0			
		} else {
			Logger("tasks", "incomplete")
		}			
	return
	
	WaitingOnReply:
		Gui, Submit, NoHide
		Logger("WOR", "audit activated")
		AuditRoute("WOR")	
		GuiControl, , NotesRead, 0
		GuiControl, , CustomerAgreementAudited, 0
		GuiControl, , DiagramAudited, 0
		GuiControl, , FloorWizardAudited, 0
		GuiControl, , TransitionsAudited, 0
		GuiControl, , LineCommentsAudited, 0
		GuiControl, , MiscAudited, 0
		GuiControl, , MaterialsAssigned, 0		
	return

	TestButton:
		Gui, Submit, NoHide
		Logger("TEST", "BUTTON")
		AuditRoute("TestButton")		
	return
}