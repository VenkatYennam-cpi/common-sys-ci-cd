%dw 2.0
output application/json

---
vars.requestIdaccumulatorVar + {
	"id": vars.requestIdVar,
	"status": payload.RequestStatus
}