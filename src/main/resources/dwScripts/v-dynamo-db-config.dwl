%dw 2.0
output application/json
---
{
	"accessKey" : p('secure::dynamo.' ++ payload.account_id ++ '.accessKey'),
	"secretKey" : p('secure::dynamo.' ++ payload.account_id ++ '.secretKey'),
	"region" : p('secure::dynamo.' ++ payload.account_id ++ '.region')
}