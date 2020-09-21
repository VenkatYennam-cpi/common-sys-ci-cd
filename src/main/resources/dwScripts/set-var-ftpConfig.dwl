%dw 2.0
output application/json
---
{
	"host" : p('secure::ftp.' ++ payload.account ++ '.host'),
	"port" : p('secure::ftp.' ++ payload.account ++ '.port'),
	"username" : p('secure::ftp.' ++ payload.account ++ '.username'),
	"password" : p('secure::ftp.' ++ payload.account ++ '.password')
}