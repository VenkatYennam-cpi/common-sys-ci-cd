%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    last_modified_date: null,
    version_id: null,
    expiration_time_rule_id: null,
    expiration_time: null,
    etag: [
      "6ccb8fac358fea58732ed8ffec85b9f5"
    ]
  }
])