;========================================;
; AuditBot  - 2019 - (Experimental) 	 ;
; Zachary Drummond - zdrummon@gmail.com) ;
;========================================;

global Version := "0.0.0.8"
global TestMode := false
global DailyLogName := "C:\Zachary's Experiments\AuditBot\Logs\" . A_MM . "-" . A_DD . "-" . A_YYYY . " audit log.txt"
global AuditCount := 0
global LastAuditDay := 0 
global WORNote := "WOR"

Loop, read, %DailyLogName%
{
	LogAuditRead := SubStr(A_LoopReadLine, 37, 5)
	if (LogAuditRead == "audit") 
	{
			LogAuditRead := SubStr(A_LoopReadLine, 50, 2)
			AuditCount := LogAuditRead
	}
}

OutputDebug, %A_ScriptName%: /=============================\
OutputDebug, %A_ScriptName%: | AuditBot %Version%            |
OutputDebug, %A_ScriptName%: | by Zachary Drummond (2019)  |
OutputDebug, %A_ScriptName%: | email: zdrummon@gmail.com   |
OutputDebug, %A_ScriptName%: | show: ctrl + alt + a        |
OutputDebug, %A_ScriptName%: | test: ctrl + alt + t        |
OutputDebug, %A_ScriptName%: \=============================/

AuditBotGUI()
Logger(DailyLogName . " puts the count at", AuditCount)
OutputDebug, AuditBot.ahk: ====================================================================================================
FileAppend, `n ====================================================================================================, %DailyLogName%

^!a::
	AuditBotGUI()
return

#Include Subroutines\TestHandler.ahk
#Include Subroutines\RouteHandler.ahk
#Include Subroutines\LogHandler.ahk
#include Subroutines\GUIHandler.ahk