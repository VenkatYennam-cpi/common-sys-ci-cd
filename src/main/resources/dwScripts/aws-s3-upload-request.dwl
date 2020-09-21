%dw 2.0
output application/java
import fromBase64 from dw::core::Binaries
---
{
	"folder_name" : payload.folder_name,
	"file_name" : payload.file_name,
	"content" : fromBase64(payload.content)
	
}