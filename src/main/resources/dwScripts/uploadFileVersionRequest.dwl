%dw 2.0
import * from dw::core::Binaries
output multipart/form-data

---
{
  parts : {
	attributes : {
	    	headers : {
	        "Content-Type" : "application/json"
	      	},
		    content : {
		    		name: payload.name,
				parent: {
		    			id: attributes.headers.folder_id default (attributes.headers.jobFolderId)
		  		}			
		    }	
  	},
	file : {
		content : if((payload.file != null) and (payload.file != "")) fromBase64(payload.file) else null,
	 	headers : {
			"Content-Disposition" : {
			name: "file",
	        filename: payload.name
	    },
	    "Content-Type" : payload.contentType default "application/octet-stream"
	  }
	 	}
	}
}
