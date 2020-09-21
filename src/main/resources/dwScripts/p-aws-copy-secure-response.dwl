%dw 2.0
output application/json
---
{
	"last_modified_date": payload.lastModifiedDate,
	"version_id": payload.versionId,
	"expiration_time_rule_id": payload.expirationTimeRuleId,
	"expiration_time": payload.expirationTime,
	"etag": payload.ETag
}