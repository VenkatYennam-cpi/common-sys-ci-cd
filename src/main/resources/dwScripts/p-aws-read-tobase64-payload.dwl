%dw 2.0
import toBase64 from dw::core::Binaries
output application/json
---
{
	"content": toBase64(payload)
}