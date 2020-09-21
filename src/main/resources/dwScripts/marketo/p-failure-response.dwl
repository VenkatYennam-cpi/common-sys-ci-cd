%dw 2.0
output application/json
import * from dw::core::Objects
import toBase64 from dw::core::Binaries
---
{
"format": "CSV",
"failure_data":  toBase64(read(payload,"text/plain")),
"batch_id": vars.batch_id
}