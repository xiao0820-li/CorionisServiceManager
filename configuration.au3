#include-once
#cs -------------------------------------------------------------------------

 Configuration data and handling

 These data describe the site-specific parameters used by
 the Corionis Service Manager program.

 The appcfg_filepath is relative to the directory containing the
 executable.

#ce -------------------------------------------------------------------------

;----------------------------------------------------------------------------
; Setup & Directives
AutoItSetOption("MustDeclareVars", 1)

;----------------------------------------------------------------------------
; Includes

; application components
#include "pan.au3"						; must be include first
#include "guiLog.au3"

;----------------------------------------------------------------------------
; globals
global $_configurationVersion = ""

global $_configurationFilePath = ""		; path to ssm.ini

; status
global $_configurationMsg = "not loaded"
global $_configurationStatus = 1

;----------------------------------------------------------------------------
Func configurationReadConfig()
	Dim $cd = @ScriptDir
	$_configurationFilePath = $cd & "\config\ssm.ini"
	If FileExists($_configurationFilePath) Then
		$_configurationVersion = IniRead($_configurationFilePath, "ssm", "cfgvers", "")
		$_configurationStatus = 0
		$_configurationMsg = "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" & @CRLF & _
			"Application configuration" & @CRLF & _
			"    cfgvers:" & @TAB & $_configurationVersion & @CRLF
	Else
		$_configurationStatus = 2
		$_configurationMsg = $_configurationFilePath & " configuration file not found" & @CRLF
	EndIf
	$_panErrorValue = $_configurationStatus
	If $_panErrorValue <> 0 Then
		$_panErrorMsg = $_configurationMsg
	EndIf
	guiLogAppend($_configurationMsg)
EndFunc

; end
