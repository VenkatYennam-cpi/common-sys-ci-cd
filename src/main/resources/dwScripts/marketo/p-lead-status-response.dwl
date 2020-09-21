%dw 2.0
output application/json
---
{
	"request_id": payload.requestId,
	"result": payload.result map {
		"batch_id": $.batchId,
		"import_id": $.importId,
		"status": $.status,
		"num_of_leads_processed": $.numOfLeadsProcessed,
		"num_of_rows_with_warning": $.numOfRowsWithWarning,
		"num_of_rows_failed": $.numOfRowsFailed,
		"message": $.message
	},
	"success": payload.success
}