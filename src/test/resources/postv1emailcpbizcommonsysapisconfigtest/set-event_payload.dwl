{
"attachments" : {
	"files" : [{
		"filename" : "file1.txt",
		"content" : "this is the content in file1"
		},
		{
		"filename" : "file2.txt",
		"content" : "this is the content in file2"
		}]
	},
"data" : {

	"to_addresses": "sreekari.d@chargepoint.com",
	"subject": "Bad Request",
	"body": {
		"content": "",
		"template": 
		"<html><head><style>table tr:nth-child(odd) td{  background-color: #ECF7FD;  color: black;}table tr:nth-child(even) td{  background-color:#FFFFFF;  color: black;}table th { color: #fff; background-color: #7a9caf;}table td{ text-align: left;}</style></head><body><br><br><table border =0; width = '100%'><th>EXTRON ACTIVITY REPORT : OUTGOING</th></table><p align='left'><b> Processed File Name:</b> file name  <b> Lines Processed: </b> lines processed</p><p align='left'><b>Activity Details</b></p><table border =0; width = '100%'><tr><th width = '10%'; align='left'>Order No</th><th width = '10%'; align='left'>Delivery Id</th><th width = '5%'; align='left'>Line</th><th width = '55%'; align='left'>Description</th><th width = '5%'; align='left'>Qty</th><th width = '5%'; align='left'>ASN</th><th width = '10%'; align='left'>Ship Date</th></tr><tr><td width = '10%';></td><td width = '10%';></td><td width = '10%';></td><td width = '40%';></td><td width = '10%';></td><td width = '10%';></td><td width = '10%';></td><tr></table>-----------------------------------------------------------<br>This is an auto generated e-mail, please do not reply to this e-mail.<br><body></html>",
"content_type": "text/html"
		}
	}
}