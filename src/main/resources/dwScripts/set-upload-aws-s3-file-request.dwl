%dw 2.0
output application/json
import * from dw::core::Objects
import toBase64 from dw::core::Binaries
---
{
	"folder_name" : payload.folder_name,
	"file_name" : payload.file_name,
	"content": toBase64(payload.content)
}