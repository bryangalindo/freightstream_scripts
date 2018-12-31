; Inland Script
; ----------------------------------------------------------------------------------
!i::
Gui, New
Gui, Add, Text,, Carrier
Gui, Add, DropDownList, vCarrierInput, APL|ONE|MSC|CMA|HAPAG|MAERSK|OOCL|EVERGREEN|COSCO|YANGMINGLINE|ZIM|WANHAI|SMLINE
Gui, Add, Text,, PO Box
Gui, Add, Edit, vPOBox
Gui, Add, Text,, Place of Delivery
Gui, Add, Edit, vDeliveryLocation
Gui, Add, Button, Default gINLInputSubmit, OK
Gui, Show
RETURN

INLInputSubmit:
#Include Constants.ahk
Gui, Submit

UserSubmittedCarrier = %CarrierInput%
FMSCARRIER := CarrierArray[UserSubmittedCarrier].FMSCARRIER
MBL := CarrierArray[UserSubmittedCarrier].MBL
PREFIX := "PO: "

Winactivate, FMS 2
SENDEVENT, {F2}
SENDEVENT, {TAB 4}
SEND, %FMSCARRIER% 
SENDEVENT, {ENTER 2}
SENDEVENT, {TAB}
SENDEVENT, %MBL% 
SENDEVENT, {TAB 20}
SEND, %DELIVERYLOCATION%
SENDEVENT, {TAB 7}
SENDEVENT, {DOWN 4}
SENDEVENT, {TAB 6}

KEYWAIT, INSERT, D

SENDEVENT, {ESC}
SENDEVENT, {LEFT}
SENDEVENT, {ENTER}
SLEEP, 200
SENDEVENT, {ENTER}
SLEEP, 1200
SENDEVENT, {ENTER 2}
SENDEVENT, {F6}
SENDEVENT, {F2}
SENDEVENT, {TAB 6}
SEND, %PREFIX%%POBox%
SENDEVENT, {TAB}
SEND, MASTER H
SENDEVENT, {ENTER 2}
SENDEVENT, {TAB 3}
SEND, MASTER H
SENDEVENT, {ENTER 2}
SENDEVENT, {TAB 7}

KEYWAIT, END,D

; Appends INL to CI Reference Number
; ------------------------------------------------------------------------------------------
ControlFocus, Edit6, FMS 2
Send, JIMMY
SENDEVENT, {ESC}
SENDEVENT, {LEFT}
SENDEVENT, {ENTER}
SLEEP, 500
SENDEVENT, {ENTER 2}
SENDEVENT, {ESC}
SENDEVENT, {F3}
SENDEVENT, {RIGHT}
SENDRAW, INL
SENDEVENT, {F12}
SLEEP, 800
SENDEVENT, {ENTER}

RETURN