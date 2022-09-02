#include <WinAPISysWin.au3>
#include <Misc.au3>

$dll = DllOpen("user32.dll")

; Constants
Const $INTERVAL = 5

; Bind Actions
HotKeySet('!q', 'Stop')
HotKeySet('x', 'pressX')

; Global Variable
Global $continue = True
Global $spam = False

; Tooltip
ToolTip('Dragonica Spam X - Alt+q to quit', 0, 0)

; Main Loop
While $continue
	Local $title = '[TITLE:' & WinGetTitle('[ACTIVE]') & ']'
	If StringInStr($title, 'Dragon') And _IsPressed("58", $dll) Then
		ControlSend($title, '', '', 'x')
	EndIf
	Sleep($INTERVAL) ; preserve CPU
WEnd

DllClose($dll)

; Functions
Func Stop ()
   $continue = 0
EndFunc

Func pressX ()
	ControlSend($title, '', '', 'x')
EndFunc