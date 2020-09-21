%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "folder_name": "cpedwqa",
  "file_name": "text1.txt",
  "account_id": "bizapps"
})