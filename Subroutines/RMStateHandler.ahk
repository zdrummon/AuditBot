;manage and set roll master screens and menus

global RMState := "closed"

;RMStatePoll () {
;	RMState := ""
;}

;RMStateChange (RMState, RMTargetState) {
;	MacroCancel()
;	RMStateActivate(RMState)
;}


RMStateManager (RMState) {
	RMStateActivate(RMState)
	RMStatePoll(RMState)
	MacroPause()
}