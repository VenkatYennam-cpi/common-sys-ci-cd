%dw 2.0
output application/json
---

vars.acc map {
		//"End_Point__c": write(vars.incomingRequest,"application/json"),
		"Payload__c": write(($.data),"application/json"),
		"Error_Message__c": write($, "application/json"),
		"Error_Description__c": write(($.error_descriprion),"application/json"),
		"Send_to_CRM_Team__c": true,
		"Object_Name__c": vars.objectName,
		"Method_Name__c": "POST",
		"Org_Name__c": vars.NAV_CompanyName
	}