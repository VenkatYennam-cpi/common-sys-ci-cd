%dw 2.0
output application/json
---
{
	"accessKey": p('secure::aws.' ++ (lower(payload.account_id)) ++ '.accessKey'),
	"secretKey": p('secure::aws.' ++ (lower(payload.account_id)) ++ '.secretKey'),
	"region": p('secure::aws.' ++ (lower(payload.account_id)) ++ '.region'),
	"role": p('secure::aws.' ++ (lower(payload.account_id)) ++ '.role'),
	"encrypt": {
		"key_path": p('mule.home') ++ "/apps/" ++ p('app.name') ++ "/" ++ p('encrypt.keyStore.fileName'),
		"key_alias": p('encrypt.key.alias'),
		"key_password": p('encrypt.key.password')
	}
}