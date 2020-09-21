%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "request_id": "17863#1743b237afb",
  "result": [
    {
      "export_id": "d953707b-f5df-437a-9f00-e000d56a0af7",
      "format": "CSV",
      "status": "Created",
      "created_at": "2020-08-27T17:01:18Z"
    }
  ],
  "success": true
})