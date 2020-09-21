%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "request_id": "16851#174335f36df",
  "result": [
    {
      "export_id": "ca404064-ce43-4fc3-8c50-9ba865bfb56d",
      "format": "CSV",
      "status": "Created",
      "created_at": "2020-08-28T04:41:52Z"
    }
  ],
  "success": true
})