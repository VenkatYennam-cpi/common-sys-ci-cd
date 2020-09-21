%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "total_count": 1,
  "file_id": "673101638990",
  "link": "https://chargepoint-sandbox.app.box.com/file/673101638990",
  "size": 14748,
  "created_at": "2020-05-29T02:09:33-07:00"
})