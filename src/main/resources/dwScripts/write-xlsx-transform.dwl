%dw 2.0
output application/xlsx
---
content : payload..body.content.Sheet1 reduce ($$ ++ $)

