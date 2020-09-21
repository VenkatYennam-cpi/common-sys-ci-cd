%dw 2.0
output application/json
import toBase64 from dw::core::Binaries
---
{
"format": "CSV",
"warning_data":  toBase64(read(payload,"text/plain")),
"batch_id": vars.batch_id
}