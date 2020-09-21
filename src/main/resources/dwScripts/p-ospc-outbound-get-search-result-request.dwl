%dw 2.0
output application/xml skipNullOn="everywhere", inlineCloseOn = "null"
ns ucm http://www.oracle.com/UCM
---
{
	ucm#GenericRequest @(webKey: "cs"): {
		ucm#Service @(IdcService: "GET_SEARCH_RESULTS"): {
			ucm#Document: {
				ucm#Field @(name: "QueryText"): ("dOriginalName <starts> " ++ (("`" ++ vars.queryTextVar.original_name.starts ++ "`") default "`ReleaseToExternal`")) ++ if (vars.queryTextVar.comments.matches != null) (" <AND> xComments <matches> " ++ "`" ++ ((vars.queryTextVar.comments.matches default "")  replace /"/ with "") ++ "`") else "",
				(ucm#Field @(name: "dDocAccount"): attributes.queryParams.doc_account) if (attributes.queryParams.doc_account != null or attributes.queryParams.doc_account != ""),
				(ucm#Field @(name: "dDocTitle"): attributes.queryParams.doc_title) if (attributes.queryParams.doc_title != null or attributes.queryParams.doc_title != "")
			}
		}
	}
}