;========================================;
; AuditBot  - 2019 - (Experimental) 	 ;
; Zachary Drummond - zdrummon@gmail.com) ;
;========================================;

global Version := "0.0.0.7"
global TestMode := false
global AuditCount := 0
global LastAuditDay := 0 
global WORNote := "WOR"

OutputDebug, %A_ScriptName%: /=============================\
OutputDebug, %A_ScriptName%: | AuditBot %Version%            |
OutputDebug, %A_ScriptName%: | by Zachary Drummond (2019)  |
OutputDebug, %A_ScriptName%: | email: zdrummon@gmail.com   |
OutputDebug, %A_ScriptName%: | show: ctrl + alt + a        |
OutputDebug, %A_ScriptName%: | test: ctrl + alt + t        |
OutputDebug, %A_ScriptName%: \=============================/

AuditBotGUI()

^!a::
	AuditBotGUI()
return

#Include Subroutines\TestHandler.ahk
#Include Subroutines\RouteHandler.ahk
#Include Subroutines\LogHandler.ahk
#include Subroutines\GUIHandler.ahk