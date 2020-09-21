%dw 2.0
output application/java
---
{
	"format": payload.format,
	"file_name": payload.file_name
}