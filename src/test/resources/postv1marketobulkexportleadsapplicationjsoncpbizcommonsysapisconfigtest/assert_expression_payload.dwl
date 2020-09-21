%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "request_id": "2f84#17433c3f0fc",
  "result": [
    {
      "export_id": "9f1340d4-a802-49ef-a6c3-4e11b71af7c3",
      "format": "CSV",
      "status": "Created",
      "created_at": "2020-08-28T06:31:54Z"
    }
  ],
  "success": true
})