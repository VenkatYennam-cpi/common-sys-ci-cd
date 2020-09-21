%dw 2.0
import * from dw::core::Strings
output application/json
---
vars.scanOperationResponse[0] mapObject ((value, key, index) -> (underscore(key)) : value)