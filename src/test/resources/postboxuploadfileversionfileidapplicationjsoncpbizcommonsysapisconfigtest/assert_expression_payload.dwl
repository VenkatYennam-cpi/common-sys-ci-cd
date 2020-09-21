%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "total_count": 1,
  "link": "https://chargepoint-sandbox.app.box.com/file/673111370689",
  "file_id": "673111370689",
  "name": "Chargepoint_US_SHIP_COM_20190830_113848_MuleSoft22.txt",
  "size": 14747,
  "etag": "1",
  "created_at": "2020-06-02T00:25:09-07:00",
  "modified_at": "2020-06-02T00:25:37-07:00"
})