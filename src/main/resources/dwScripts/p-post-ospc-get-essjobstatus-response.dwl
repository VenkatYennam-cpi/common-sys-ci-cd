%dw 2.0
output application/json
---
{
	"request_id": vars.jobexecutiondetailsVar.request_id,
	"document_content": vars.jobexecutiondetailsVar.document_content,
	"status": ((vars.requestIdaccumulatorVar[?((upper ($.status)) != 'SUCCEEDED')])[0].status) default "SUCCEEDED"
}
