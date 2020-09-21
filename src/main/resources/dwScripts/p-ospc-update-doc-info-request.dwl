%dw 2.0
output application/xml
ns ucm http://www.oracle.com/UCM
---
{
	ucm#GenericRequest @(webKey: "cs"): {
		ucm#Service @(IdcService: "UPDATE_DOCINFO"): {
			ucm#Document: {
				ucm#Field @(name: "dID"): payload.id,
				ucm#Field @(name: "dDocName"): payload.doc_name,
				ucm#Field @(name: "xComments"): payload.comments,
				
			}
		}
	}
}