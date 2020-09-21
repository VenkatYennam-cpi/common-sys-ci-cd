%dw 2.0
output application/json
---
{
	"OperationName": "importBulkData",
	"DocumentContent": payload.document_content,
	"ContentType": payload.content_type,
	"FileName": payload.file_name,
	"DocumentAccount": "scm/planningDataLoader/import",
	"JobName": "/oracle/apps/ess/scm/advancedPlanning/collection/configuration,CSVController",
	"ParameterList": p('ospc.sourceSystem') ++ "," ++ payload.collection_type ++ "," ++
                       payload.file_name ++ "," ++ "NULL" ++ "," ++ (payload.document_id default ((random() * 1000000) as String)[0 to 4]) ++ "," ++ "300000001658003,3",
	"CallbackURL": payload.callback_url,
	"NotificationCode": payload.notification_code,
	"JobOptions": "InterfaceDetails=" ++ (payload.interface_details default "135") ++ "," ++ "ImportOption=" ++ (payload.import_option default "N")
}