%dw 2.0
output application/json
---
{
	"request_id": payload.requestId,
	"result": payload.result map {
		
		"export_id": $.exportId,
		"format": $.format,
		"status": $.status,
		"created_at": $.createdAt,
        ("finished_at" : $.finishedAt) if(not (isEmpty($.finishedAt))),
        ("queued_at" : $.queuedAt) if(not (isEmpty($.queuedAt))),
        ("started_at" : $.startedAt) if(not (isEmpty($.startedAt))),
        ("number_of_records" : $.numberOfRecords) if(not (isEmpty($.numberOfRecords))),
        ("file_size" : $.fileSize) if(not (isEmpty($.fileSize))),
        ("file_check_sum" : $.fileChecksum) if(not (isEmpty($.fileChecksum)))
	},
	"success": payload.success
}