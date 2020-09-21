%dw 2.0
import java!com::cp::auth::AuthHelper
import * from dw::System
output application/java
var configPath = ('box_' ++ p('secure::env.name') ++ '_config.json')
---
AuthHelper::getBoxAccessToken(configPath)