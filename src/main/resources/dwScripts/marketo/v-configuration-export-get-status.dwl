%dw 2.0
output application/json
---
{
	"marketo_host": p('secure::marketo.' ++ (lower (attributes.headers.region)) ++ '.host'),
	"oauth_client_id": p('secure::marketo.' ++ (lower (attributes.headers.region)) ++ '.clientId'),
	"oauth_client_secret": p('secure::marketo.' ++ (lower (attributes.headers.region)) ++ '.clientSecret'),
	"list_id": attributes.queryParams.list_id,
	"path" : if (attributes.requestPath contains "leads")p('marketo.path.bulkExportRetrieveStatusLeads') else p('marketo.path.bulkExportRetrieveStatusActivities')
	
}