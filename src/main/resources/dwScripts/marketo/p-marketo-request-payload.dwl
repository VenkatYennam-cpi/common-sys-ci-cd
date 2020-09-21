%dw 2.0
import dw::module::Multipart
output multipart/form-data boundary = "--------------------------LeadData"
---
{
	parts: {
		file1: {
			headers: {
				"Content-Disposition": {
					"name": "file",
					"filename": vars.requestpayload.file_name
				},
				"Content-Type": "application/csv"
			},
			content: payload
		}
	}
}