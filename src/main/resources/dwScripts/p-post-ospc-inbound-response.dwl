%dw 2.0
output application/json
---
{
	"request_id": payload.ReqstId,
	"request_status": payload.RequestStatus,
	"status_code": payload.StatusCode
}