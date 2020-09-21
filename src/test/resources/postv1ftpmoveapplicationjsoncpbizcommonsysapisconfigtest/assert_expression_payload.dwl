%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "sourcePath": "/Flex_ChPnt_Inv/Archive/SerializedOnHand_073020_105225.csv",
  "targetPath": "/temp/archive",
  "account": "flex"
})