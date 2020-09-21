%dw 2.0
import * from dw::core::Strings
output application/json
fun trimString(temp,op) = temp replace "{" with "" 
replace "}" with ""  
replace "==" with " = "
replace "=!=" with " != "
replace "=>" with " > "
replace "=<" with " < "
replace "=>=" with " >= "
replace "=<=" with " <= "
replace "," with (" " ++ op ++ " ")
fun expressionAttributeNames(obj,key1) = (obj  match {
    case is Object -> obj mapObject ((value, key, index) ->
     if(p('dynamo.reseveredKeys.' ++ ((key) as String)) != null)
     	({ (("#"++ (key) ++ "_ref") ) : (key)} )  else {})
})
fun expressionAttributeValues(obj,key) = (obj  match {
    case is Object -> obj mapObject ((value, key, index) ->
     if(not isEmpty(value)) ({ (":" ++ (key)) : {
         (p('dynamoDb.keyTypes.' ++ value.data_type)): value.value
     }} )  else {})
}) default {}
fun expressionFilter(obj,key1) = (obj  match {
    case is Object -> obj mapObject ((value, key, index) ->
     if((not isEmpty(value)) and (p('dynamo.reseveredKeys.' ++ ((key) as String)) != null)) ({ (("#"++ (key) ++ "_ref") ) : ((p('dynamoDb.operators.' ++ value.operator)) ++ " " ++ (":" ++ (key)))} )  else ({ (key) : ((p('dynamoDb.operators.' ++ value.operator)) ++ " " ++ (":" ++ (key)))} ))
}) default {}
fun removePair(e, predicate) =
  e match {
    case is Array  -> e map removePair($, predicate)
    case is Object -> if(e.filter_attributes != null) (e mapObject (v, k) ->
                        if (predicate(k))
                          {
                              "expression_attribute_names" : if(not isEmpty(expressionAttributeNames(v,k))) expressionAttributeNames(v,k) else null,
                              "expression_attribute_values" : if(not isEmpty(expressionAttributeValues(v,k))) expressionAttributeValues(v,k) else null,
                              "filter_expression" : if(not isEmpty(expressionFilter(v,k)))  trimString(write((expressionFilter(v,k)),"application/java"),e.conditional_operator) else null
                          }
                        else
                          {(k): removePair(v, predicate)}) 
                        else (e mapObject (v, k) ->
                        if (predicate(k))
                          {}
                        else
                          {(k): removePair(v, predicate)})
    else           ->  e
  }
fun scanRequestPayload(e) =
  removePair(
    e,
    ((k) -> ((k as String) == "filter_attributes"))
  )
---
scanRequestPayload(payload - "account_id")
