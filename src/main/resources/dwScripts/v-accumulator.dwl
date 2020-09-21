%dw 2.0
output application/json
import toBase64 from dw::core::Binaries
var rowVar = payload.Body.GenericResponse.Service.Document.*ResultSet[?($.@name == "FILE_DOC_INFO")].Row
---
vars.accumulatorVar + {
	"id": vars.id,
	"file_name": payload.Body.GenericResponse.Service.Document.*Field[?($.@name == "FileName")][0],
	"original_name": rowVar.*Field[?($.@name == "dOriginalName")][0],
	"format": rowVar.*Field[?($.@name == "dFormat")][0],
	"extension": rowVar.*Field[?($.@name == "dExtension")][0],
	"file_size": rowVar.*Field[?($.@name == "dFileSize")][0],
	"content": (toBase64(payload.attachments[0])) default null
}