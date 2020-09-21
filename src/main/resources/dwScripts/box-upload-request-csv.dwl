%dw 2.0
import * from dw::core::Binaries
output multipart/form-data
import * from dw::core::Objects
import fromBase64 from dw::core::Binaries

---
{
  parts : {
	attributes : {
	    	headers : {
	        "Content-Type" : "application/json"
	      	},
		    content : {
		    		name: (((payload.name splitBy  "/")[-1]) splitBy  ".") joinBy  "22.", //(payload.targetPath splitBy  "/")[-1],
				parent: {
		    			id: payload.fileId

		  		}			
		    }	
  	},
	file : {
		content : read(fromBase64(payload.file), "application/json"),
	 	headers : {
			"Content-Disposition" : {
			name: "file",
	        filename: (payload.name splitBy  "/")[-1]
	    },
	    "Content-Type" : "application/csv"
	  }
	 	}
	}
}
