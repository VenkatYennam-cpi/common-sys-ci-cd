%dw 2.0
import java!com::cp::secure::copyObject
output application/json
---
(copyObject::copySecure(payload.source_folder_name,payload.source_file_name,payload.destination_folder_name,payload.destination_file_name,vars.configVarAws.accessKey,vars.configVarAws.secretKey,vars.configVarAws.region,vars.configVarAws.role,vars.configVarAws.role))