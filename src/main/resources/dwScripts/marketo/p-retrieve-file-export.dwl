%dw 2.0
output application/json
import toBase64 from dw::core::Binaries
---
{
	export_id : vars.export_id,
	content_data : toBase64(write(payload))
}