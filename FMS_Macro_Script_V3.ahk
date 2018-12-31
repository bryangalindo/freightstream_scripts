!K::
Gui, New
Gui, Add, Text,, Operator
Gui, Add, DropDownList, vOperator, Alicia|Maggie|Jimmy|Spencer|Raymond
Gui, Add, Text,, Agent
Gui, Add, DropDownList, vAgentInput, PDQD|PDTJ|PDSH|PDDL|PPILS|PPILCE|PPILSZ|PPILSCM|PPILLYG|NTT|NPT|NDL|NTJ|NXM|CHINATRAN|CHINATRANSPORTSHA|APA|HUAFENG|XENA|WHSE|
Gui, Add, Checkbox, vAMS, AMS?
Gui, Add, Checkbox, vTelex, Telex?
Gui, Add, Checkbox, vDoor, Door Move?
Gui, Add, Checkbox, vSOC, SOC?
Gui, Add, Checkbox, vContainers, Multiple Containers?
Gui, Add, Text,, Carrier
Gui, Add, DropDownList, vCarrierInput, APL|ONE|MSC|CMA|HAPAG|MAERSK|OOCL|EVERGREEN|COSCO|YANGMINGLINE|ZIM|WANHAI|SMLINE
Gui, Add, Text,, ETD	
Gui, Add, Edit, vETD
Gui, Add, Text,, Place of Discharge	
Gui, Add, Edit, vPOD
Gui, Add, Text,, MBL Place of Delivery
Gui, Add, Edit, vFOD
Gui, Add, Text,, Door Location
Gui, Add, Edit, vDOD
Gui, Add, Button, Default gFMSInputSubmit, OK
Gui, Show
RETURN


FMSInputSubmit:
#Include Constants.ahk
Gui, Submit

UserSubmittedAgent = %AgentInput%
UserSubmittedCarrier = %CarrierInput%

LOADPORT := AgentsArray[UserSubmittedAgent].LOADPORT
FMSAGENT := AgentsArray[UserSubmittedAgent].FMSAGENT
FMSCARRIER := CarrierArray[UserSubmittedCarrier].FMSCARRIER

if (UserSubmittedAgent && UserSubmittedCarrier) {
	if (AgentsArray[UserSubmittedAgent].CARRIERS[UserSubmittedCarrier]) { ; checks if submitted carrier exists in respective agent array
		AGENTREF := AgentsArray[UserSubmittedAgent].AGENTREF . AgentsArray[UserSubmittedAgent].CARRIERS[UserSubmittedCarrier].AGENTREF
		MBL := AgentsArray[UserSubmittedAgent].CARRIERS[UserSubmittedCarrier].MBL
	} else {
		AGENTREF := AgentsArray[UserSubmittedAgent].AGENTREF
		MBL := CarrierArray[UserSubmittedCarrier].MBL ; if carrier not in CarrierArray, returns empty or "" value
	}
} else if (UserSubmittedAgent && !UserSubmittedCarrier) {
	AGENTREF := AgentsFuncArray[UserSubmittedAgent].AGENTREF
	MBL := ""
} else if (!UserSubmittedAgent && UserSubmittedCarrier) {
	AGENTREF := ""
	MBL := CarrierArray[UserSubmittedCarrier]
} else {
	AGENTREF := ""
	MBL := ""
}

; Master Bill side of FreightStream
; ----------------------------------------------------------------------------------
Winactivate, FMS 2
SENDEVENT, {F2}
SENDEVENT, {TAB 2}
SEND  %AGENTREF%
SENDEVENT, {TAB}
IF (UserSubmittedAgent != ""){
	SEND %FMSAGENT%
	SENDEVENT, {ENTER 2}
}
SENDEVENT, {TAB}
SEND %FMSCARRIER%
SENDEVENT, {ENTER}
SLEEP, 300
SENDEVENT, {ENTER}
SLEEP,300
SENDEVENT, {TAB 1}
SEND %MBL%
IF (Containers = 1){
	KEYWAIT, PgUp, D
	SENDEVENT, +{HOME}
	SENDEVENT, ^{C}
}
SENDEVENT, {TAB 13}
IF (LOADPORT != "") {
	SEND %LOADPORT%
	SENDEVENT, {ENTER 2}
}
SENDEVENT, {TAB 3}
IF (POD != "") {
	SEND %POD%
	SENDEVENT, {ENTER 2}
}	
SENDEVENT, {TAB 3}
IF (POD != ""){
	IF (FOD = ""){
		SEND %POD%
	} ELSE {
		SEND, %FOD%
	}
}
SENDEVENT, {ENTER 2}
SENDEVENT, {TAB 8}
IF (Door = 1){
	SENDEVENT, {DOWN 4}
	} ELSE {
		SENDEVENT, {DOWN 3}
	}
SENDEVENT, {TAB}
IF (Telex = 1){
	SENDEVENT, {SPACE}
}
SENDEVENT, +{TAB 13}
SEND, %ETD%
SENDEVENT, {TAB 3}
SEND, %ETA%
SENDEVENT, {TAB 14}

KEYWAIT, INSERT, D

; House bill side of FreightStream (customer info, container contents)
; ----------------------------------------------------------------------------------
SENDEVENT, +{HOME}
SENDEVENT, ^{C}
Commodity := clipboard
SENDEVENT, +{TAB 5}
clipboard =
SENDEVENT, +{END}
SENDEVENT, ^{C}
UserSubmittedAGENTREF := clipboard
SENDEVENT, {ESC}
SENDEVENT, {LEFT}
SENDEVENT, {ENTER}
SLEEP, 200
SENDEVENT, {ENTER}
SLEEP, 1200
SENDEVENT, {ENTER 2}
SENDEVENT, {F6}
SENDEVENT, {F2}
SENDEVENT, {TAB}
IF (AMS = 1) {
	SEND, PPILQD
} ELSE IF (AMS = 0) {
	SEND, %UserSubmittedAGENTREF%
}

SENDEVENT, {TAB 15}
SEND, %Commodity%
IF (DOOR = 1){
	SENDEVENT, {TAB 11}
	SEND, %DOD%
	SLEEP, 300
	SENDEVENT, +{TAB 22}
	} ELSE {
	SENDEVENT, +{TAB 11}
}

KEYWAIT, TAB,D

IF (AMS = 1) {
	SENDEVENT, ^{V}
	SENDEVENT, +{TAB}
	SENDEVENT, ^{C}
	SLEEP, 200
	SENDEVENT {TAB 2}
	SENDEVENT, ^{V}
	SENDEVENT, +{TAB 1}
	SENDEVENT, ^{C}
	SENDEVENT, {BACKSPACE}
	SENDEVENT, {TAB 5}
} ELSE IF (AMS = 0) {
	SENDEVENT, {TAB 5}
}

KEYWAIT, END,D

; Appends load port shorthand (e.g. QDF) to CI reference number with SOC indicator (i.e. ^)
; ------------------------------------------------------------------------------------------
ControlFocus, Edit6, FMS 2
Send, %Operator%
SENDEVENT, {ESC}
SENDEVENT, {LEFT}
SENDEVENT, {ENTER}
SLEEP, 500
SENDEVENT, {ENTER 2}
SENDEVENT, {ESC}
SENDEVENT, {F3}
SENDEVENT, {RIGHT}
POLAppend := LoadPortArray[LOADPORT]
IF (SOC = 1) {
	SEND, %POLAppend% . "^"
	} ELSE {
	SEND, %POLAppend%	
}
IF (SOC = 1) {
	SENDEVENT, {TAB 37}
	clipboard = 
	SENDEVENT, ^{C}
	ClipWait
	ContainerContents := clipboard
	SOCTester := InStr(ContainerContents , "SOC")
	IF (SOCTester = 0) {
		MsgBox,,, Oops! You forgot to add SOC to container type. , 5	
	} ELSE {
		SENDEVENT, {F12}
		SLEEP, 800							
		SENDEVENT, {ENTER}
	}
}
SENDEVENT, {F12}
SLEEP, 800
SENDEVENT, {ENTER}

RETURN
RETURN

; Miscellaneous
; ----------------------------------------------------------------------------------
^TAB::
SENDEVENT, {TAB 11}
RETURN

				
^UP::
ControlFocus, ThunderRT6TextBox36, FMS 2
SENDINPUT, {RIGHT}
RETURN	

PgDn::Insert
