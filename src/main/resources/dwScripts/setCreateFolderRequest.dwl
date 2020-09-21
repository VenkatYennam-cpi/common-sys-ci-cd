%dw 2.0
output application/json
---
{
	"name" : payload.name,
	"parent" : {
		"id" : payload.parent.id
	}
}