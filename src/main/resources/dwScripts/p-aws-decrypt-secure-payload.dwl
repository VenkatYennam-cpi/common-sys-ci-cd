%dw 2.0
import java!com::cp::secure::S3Decryption
import toBase64 from dw::core::Binaries
output application/json
---
{
	"content": toBase64(S3Decryption::fileDecryption(payload.folder_name,payload.file_name,vars.configVarAws.accessKey,vars.configVarAws.secretKey,vars.configVarAws.region,vars.configVarAws.role,vars.configVarAws.encrypt))
}