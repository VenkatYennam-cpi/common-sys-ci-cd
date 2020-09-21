%dw 2.0
output application/json
---
{
	"accessKey" : p('secure::aws.' ++ (lower(payload.account_id)) ++ '.accessKey'),
	"secretKey" : p('secure::aws.' ++ (lower(payload.account_id)) ++ '.secretKey'),
	"region" : p('secure::aws.' ++ (lower(payload.account_id)) ++ '.region'),
	"role" : p('secure::aws.' ++ (lower(payload.account_id)) ++ '.role')
}