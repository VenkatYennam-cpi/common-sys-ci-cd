%dw 2.0
output application/json
---
{
	"request_id": payload.ReqstId,
	"document_content": payload.DocumentContent
}
