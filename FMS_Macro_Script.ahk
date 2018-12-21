!K::
Gui, New
Gui, Add, Checkbox, vSOC, SOC?
Gui, Add, Text,, Agent
Gui, Add, DropDownList, vAgentInput, PDQD|PDTJ
Gui, Add, Text,, Carrier
Gui, Add, DropDownList, vCarrierInput, APL|ONE|MSC|CMA|HAPAG|MAERSK|OOCL|EVERGREEN|COSCO|YANGMINGLINE|ZIM|SMLINE
Gui, Add, Button, Default gFMSInputSubmit, OK
Gui, Show
RETURN


FMSInputSubmit:
#Include Constants.ahk
Gui, Submit, nohide

UserSubmittedAgent = %AgentInput%
UserSubmittedCarrier = %CarrierInput%
LOADPORT := AgentsFuncArray[UserSubmittedAgent].LOADPORT
FMSAGENT := AgentsFuncArray[UserSubmittedAgent].FMSAGENT

if (UserSubmittedAgent && UserSubmittedCarrier) {
	if (AgentsFuncArray[UserSubmittedAgent].CARRIERS[UserSubmittedCarrier]) { ; checks if submitted carrier exists in respective agent array
		AGENTREF := AgentsFuncArray[UserSubmittedAgent].CARRIERS[UserSubmittedCarrier].AGENTREF
		MBL := AgentsFuncArray[UserSubmittedAgent].CARRIERS[UserSubmittedCarrier].MBL
	} else {
		AGENTREF := AgentsFuncArray[UserSubmittedAgent].AGENTREF
		MBL := CarrierArray[UserSubmittedCarrier] ; if carrier not in CarrierArray, returns empty or "" value 
	}
} else if (UserSubmittedAgent && !UserSubmittedCarrier) {
	AGENTREF := AgentsFuncArray[UserSubmittedAgent].AGENTREF
	MBL := ""
} else if (!UserSubmittedAgent && UserSubmittedCarrier){
	MBL := CarrierArray[UserSubmittedCarrier]
} else {
	MBL := ""
}

if (SOC = 1) {
	SEND, LoadPortArray[LOADPORT] . "^"
} else {
	SEND, LoadPortArray[LOADPORT]
}

RETURN