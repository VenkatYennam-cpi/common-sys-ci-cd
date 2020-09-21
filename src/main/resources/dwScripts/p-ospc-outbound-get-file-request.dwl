%dw 2.0
output application/xml
ns ucm http://www.oracle.com/UCM
---
{
	ucm#GenericRequest @(webKey: "cs"): {
		ucm#Service @(IdcService: "GET_FILE"): {
			ucm#Document: {
				ucm#Field @(name: "dID"): payload
			}
		}
	}
}