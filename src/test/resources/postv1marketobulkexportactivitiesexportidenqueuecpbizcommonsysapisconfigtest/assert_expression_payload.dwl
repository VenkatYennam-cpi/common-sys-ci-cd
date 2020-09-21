%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
    "request_id": "a048#1743b006907",
    "result": [
        {
            "export_id": "24bbfdc6-1d45-4b18-83b6-ff909f6c38b7",
            "format": "CSV",
            "status": "Queued",
            "created_at": "2020-08-26T16:46:32Z",
            "queued_at": "2020-08-29T16:15:16Z"
        }
    ],
    "success": true
})