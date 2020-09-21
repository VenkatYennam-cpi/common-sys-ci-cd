%dw 2.0
output application/json
---
[payload] map {
	"last_modified_date" : $.lastModifiedDate,
	"version_id" : $.versionId,
	"expiration_time_rule_id" : $.expirationTimeRuleId,
	"expiration_time" : $.expirationTime,
	"etag" : $.etag
}