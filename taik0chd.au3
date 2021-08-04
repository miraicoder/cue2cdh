#cs ----------------------------------------------------------------------------
taik0chd file converter

 AutoIt Version: 3.3.14.5
 Author:         miraicoder

 Script Function:
	convert .cue files to .chd

#ce ----------------------------------------------------------------------------

; Script Start
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

$hGUI = GUICreate("taik0chd", 500, 500)

$idFilemenu = GUICtrlCreateMenu("Options")
$idExititem = GUICtrlCreateMenuItem("Exit", $idFilemenu)
$idConvertButton = GUICtrlCreateButton ("Convert", 50, 350, 90, 90)
$taikocute = GUICtrlCreatePic ("icon.jpg", 50, 50, 150, 150)
$dragdrop = GUICtrlCreateEdit("Drag file here...", 300, 50, 150, 50)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)
$dragdrop_handle = GUICtrlGetHandle(-1)

GUISetState(@SW_SHOW)

GUICtrlSetData($dragdrop, "Drag your file here...")

GUISetState()

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE, $idExititem
            Exit
			Case $idConvertButton
				  $idConvertButton = Run("convert.bat")
			Case $GUI_EVENT_DROPPED
				  $file = @GUI_DragFile
				  ConsoleWrite($file & @CRLF)
				  Sleep(2000)
				  _GUICtrlEdit_ReplaceSel($dropdrag_handle, "")

    EndSwitch
WEnd
