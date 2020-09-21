%dw 2.0
output application/json

fun mac_address(temp) = (if(not isEmpty(temp)) (" mac = '" ++ temp ++ "'") else "") replace "''" with "'"
fun evse_id(temp) = (if(not isEmpty(temp)) (" evse_id = '" ++ temp ++ "'") else "") replace "''" with "'"
fun station_serial_num(temp) = (if(not isEmpty(temp)) (" sn = '" ++ temp ++ "'") else "") replace "''" with "'"
fun created_week(temp) = (if(not isEmpty(temp)) trim(filterToSQLFilter(temp)) ++ "'" else "") replace "''" with "'"


var filterToSQLFilter = (rmafilter) -> 
	  
	 if(write(rmafilter,"application/java") contains "bt") 
	 	(("week >= '" ++ trim((((write(rmafilter,"application/java") splitBy ":")[1]) splitBy  ",")[0] replace "[" with "") ++ "' and week <= '" ++ trim((((write(rmafilter,"application/java") splitBy ":")[1]) splitBy  ",")[1] replace "]}" with "") ) replace "\"" with "" )
	 else 
	 	(write(rmafilter,"application/java")) replace "eq null" with "is null" 
         replace "\"" with ""
		 replace "ne null" with "is not null" 
		 replace "eq:" with "week ='" 
		 replace "ne:" with "week !=' " 
		 replace "gt:" with "week > '" 
		 replace "lt:" with "week < '" 
		 replace "ge:" with "week >= '" 
		 replace "le:" with "week <= '" 
	     replace "{" with " " 
	     replace "}" with " "
         replace "' " with "'"

var mac_address1 = attributes.queryParams.mac_address default ""
var evse_id1 = attributes.queryParams.evse_id default ""
var station_serial_num1 = attributes.queryParams.station_serial_num default ""
var created_week1 = attributes.queryParams.created_week default ""
---
p('redshift.rmaHistoryQuery') ++ (if((not isEmpty(mac_address(mac_address1))) or (not isEmpty(evse_id(evse_id1))) or (not isEmpty(station_serial_num(station_serial_num1))) or (not isEmpty(created_week(created_week1))) )((" where" ++ mac_address(mac_address1) ++ (if(not isEmpty(evse_id(evse_id1))) " and " ++ evse_id(evse_id1) else "") ++ (if(not isEmpty(station_serial_num(station_serial_num1))) " and " ++ station_serial_num(station_serial_num1) else "") ++ (if(not isEmpty(created_week(created_week1))) " and " ++ created_week(created_week1) else "")) replace "where and" with "where") else "")