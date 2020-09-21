%dw 2.0
output application/json
---
{
	"OperationName": "downloadESSJobExecutionDetails",
	"FileType": "log",
	"ReqstId": vars.requestIdVar
}
