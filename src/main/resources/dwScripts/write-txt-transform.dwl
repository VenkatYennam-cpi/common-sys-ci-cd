%dw 2.0
output text/plain
---
payload..body.content reduce ($$ ++ $)