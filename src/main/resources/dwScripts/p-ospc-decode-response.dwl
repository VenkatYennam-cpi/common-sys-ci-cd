%dw 2.0
import * from dw::core::Binaries
output application/octet-stream
---
fromBase64((payload.DocumentContent) as String) as Binary