%dw 2.0
output application/json
---
(payload.Body.GenericResponse.Service.Document.*ResultSet[?($.@name == "SearchResults")].*Row map {
	"id": $.*Field[?($.@name == "dID")][0],
	"doc_title": $.*Field[?($.@name == "dDocTitle")][0],
	"doc_type": $.*Field[?($.@name == "dDocType")][0],
	"doc_account": $.*Field[?($.@name == "dDocAccount")][0],
	"doc_name": $.*Field[?($.@name == "dDocName")][0],
	"format": $.*Field[?($.@name == "dFormat")][0],
	"original_name": $.*Field[?($.@name == "dOriginalName")][0],
	"extension": $.*Field[?($.@name == "dExtension")][0],
	"create_date": $.*Field[?($.@name == "dCreateDate")][0],
	"comments":  ($.*Field[?($.@name == "xComments")][0]) default ""
}) default []