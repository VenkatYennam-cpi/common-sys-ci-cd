%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  export_id: "3a0b1ff0-f1c4-4cd5-a557-7f9159ff751a",
  content_data: "W10gYXMgQXJyYXkge2VuY29kaW5nOiAiVVRGLTgiLCBtZWRpYVR5cGU6ICJhcHBsaWNhdGlvbi9qc29uOyBjaGFyc2V0PVVURi04IiwgbWltZVR5cGU6ICJhcHBsaWNhdGlvbi9qc29uIn0="
})