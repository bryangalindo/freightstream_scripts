MONTH := "12"
YEAR := "19"

; Add FMS formatted carriers & agents to locate correct carrier/agent (e.g. COSCO HOUSTON (A/P))
CarrierArray := {APL: {FMSCARRIER: "APL", MBL: "APLU"}, ONE: {FMSCARRIER: "ONE", MBL: "ONEY"}, CMA: {FMSCARRIER: "CMA", MBL: "CMDU"}, MAERSK: {FMSCARRIER: "MAERSK LINE", MBL: "MAEU"}, COSCO: {FMSCARRIER: "COSCO (HOUSTON)", MBL: "COSU"}, MSC: {FMSCARRIER: "MSC", MBL: "MEDU"}, HAPAG: {FMSCARRIER: "HAPAG", MBL: "HLCU"}, OOCL: {FMSCARRIER: "OOCL", MBL: "OOLU"}, SMLINE: {FMSCARRIER: "SM LINE (AP)", MBL: "SMLM"}, YANGMINGLINE: {FMSCARRIER: "YANG MING LINE (HOU)", MBL: "YMLM"}, EVERGREEN: {FMSCARRIER: "EVERGREEN", MBL: "EGLV"}, WANHAI: {FMSCARRIER: "WAN HAI LINES LTD (A/P)", MBL: "WHLC"}, ZIM: {FMSCARRIER: "ZIM-- HOUSTON", MBL: "ZIMU"}}

PDQDArray := {AGENTREF: "PDQDJM", FMSAGENT: "PUDONG TRANS (QD)", LOADPORT: "57047", CARRIERS: {APL: {MBL: "APLUTTWE", AGENTREF: "QJ"}, ONE: {MBL: "ONEYTA8PK0", AGENTREF: "ON"}, CMA: {MBL: "CMDUQDJY", AGENTREF: "CM"}, MSC: {MBL: "MEDUQ", AGENTREF: "MS"}, MAERSK: {MBL: "MAEU", AGENTREF: "MK"}, COSCO: {MBL: "COSU619", AGENTREF: "CO"}, HAPAG: { MBL: "HLCUTA118", AGENTREF: "QQ"}, ZIM: {MBL: "ZIMUQIN", AGENTREF: "BS"}}}

PDTJArray := {AGENTREF: "PDTJJM", FMSAGENT: "NEPTUNE (QD)", LOADPORT: "57017", CARRIERS: {APL: {MBL: "APLU", AGENTREF: "AP"}, ONE: {MBL: "ONEYTS8NN0", AGENTREF: "ON"}, CMA: {MBL: "CMDUCNSE", AGENTREF: "CM"}, MAERSK: {MBL: "MAEU", AGENTREF: "MK"}, COSCO: {MBL: "COSU619", AGENTREF: "CO"}, MSC: {MBL: "MEDUQ", AGENTREF: "MS"}, HAPAG: {MBL: "HLCUTS", AGENTREF: "HP"}, SMLINE: {MBL: "SMLMTSPM", AGENTREF: "SM"}}}

PDDLArray := {AGENTREF: "PDDLJM", FMSAGENT: "PUDONG TRANS (QD)", LOADPORT: "57051", CARRIERS: {ONE: {MBL: "ONEYDL8", AGENTREF: "ON"}}}

PPILSArray := {AGENTREF: "PPILS", FMSAGENT: "PUDONG TRANS (SHA)", LOADPORT: "57035", CARRIERS: {APL: {AGENTREF: "APL", MBL: "APLUSHPP"}, ONE: {AGENTREF: "ONW", MBL: "ONEYSH8ET"}, CMA: {AGENTREF: "CM", MBL: "CMDUCNSE"}, HAPAG: {AGENTREF: "UA", MBL: "HLCUSHA" . YEAR . MONTH}}}

PPILCEArray := {AGENTREF:  "PPILCE000", FMSAGENT: "PUDONG TRANS (XM)", LOADPORT: "57069", CARRIERS: {ONE: {MBL: "ONEYXMNU"}}}

PPILSZArray := {AGENTREF: "PPILSZX", FMSAGENT: "PUDONG TRANS (SZ)", LOADPORT: "57078", CARRIERS: {APL: {MBL: "APLUAJD"}, ONE: {MBL: "ONEYSZPUB"}}}

PPILSCMArray := {AGENTREF: "PPILSCM", FMSAGENT: "PUDONG TRANS (SZ)", LOADPORT: "57078"}

PPILLYGArray := {AGENTREF: "PPILLYG", FMSAGENT: "PUDONG TRANS (LYG)", LOADPORT: "57081", CARRIERS: {ONE: {MBL: "ONEYLY8P"}}}

NTTArray := {AGENTREF: "NTT" . YEAR . MONTH . "00", AGENT: "NEPTUNE (QD)", LOADPORT: "57047", CARRIERS: {ONE: {MBL: "ONEYTA8P"}, CMA: {MBL: "CMDUCNSE"}}}

NPTArray := {AGENTREF:"NPT" . YEAR . MONTH . "00", FMSAGENT: "NEPTUNE (SHA)", LOADPORT: "57035", CARRIERS: {ONE: {MBL: "ONEYSH8AC"}, CMA: {MBL: "CMDUCNSE"}}}

NDLArray := {AGENTREF:"NDL" . YEAR . MONTH . "00", FMSAGENT:"NEPTUNE (DALIAN)", LOADPORT: "57051", CARRIERS: {ONE: {MBL: "ONEYDL8CX"}, CMA: {MBL: "CMDUCNSE"}}}

NTJArray := {AGENTREF: "NTJ" . YEAR . MONTH . "00", FMSAGENT: "NEPTUNE (TJ)", LOADPORT: "57017", CARRIERS: {ONE: {MBL: "ONEYTS8NU"}}}

NXMArray := {AGENTREF: "NXM" . YEAR . MONTH . "00", FMSAGENT: "NEPTUNE (XM)", LOADPORT: "57069", CARRIERS: {ONE: {MBL: "ONEYXMNU"}}}

CHINATRANSArray := {AGENTREF: "CHIASZ2F" . YEAR . MONTH . "00", FMSAGENT: "CHINATRANS", LOADPORT: "57078"}
XENAArray := {AGENTREF: "XENA" . YEAR . "00", FMSAGENT: "XENA LOGISTICS CO LT", LOADPORT: "57017"}
CHINATRANPORTSHAArray := {AGENTREF: "CHIASH1F" . YEAR . MONTH . "00", FMSAGENT: "TRIUMPHORTUNE (SHANG", LOADPORT: "57035" , CARRIERS: {CMA: {MBL: "CMDUCNHY"}}}
HUAFENGArray := {AGENTREF: "SZA" .YEAR . MONTH, FMSAGENT: "HUAFENG TRANSPORT AG", LOADPORT: "57078"}
WHSEArray := {AGENTREF: "WHSE" . YEAR . MONTH . "0", FMSAGENT: "SHANDONG PAN-ASIA IN)", LOADPORT:  "57047"}
WANHAIArray := {AGENTREF: "WHLC", FMSAGENT: "WAN HAI LINES LTD (A/P)", LOADPORT: "57017"}

AgentsArray := {PDQD: PDQDArray, PDTJ: PDTJArray, PDDL: PDDLArray, PPILS: PPILSArray, PPILCE: PPILCEArray, PPILSZ: PPILSZArray, PPILSCM: PPILSCMArray, PPILLYG: PPILLYGArray, NTT: NTTArray, NPT: NPTArray, NDL: NDLArray, NTJ: NTJArray, NXM: NXMArray, CHINATRANS: CHINATRANSArray, XENA: XENAArray, CHINATRANSPORTSHA: CHINATRANSPORTSHAArray, APA: APAArray, HUAFENG: HUAFENGArray, WHSE: WHSEArray, WANHAI: WANHAIArray}

LoadPortArray := {57047: "QDF", 57035: "SHF", 57069: "XMF", 57078: "YTF", 57043: "TJF", 57017: "TJF", 57081: "LGF", 57051: "DLF"}
