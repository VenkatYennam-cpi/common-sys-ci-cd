%dw 2.0
output application/java
fun getType(val) = {(p('dynamoDb.keyTypes.' ++ val.attribute_type)): (val.value)}
---
{
    (vars.tableName) :
payload map ((item, index) -> ("putRequest": (item mapObject ((value, key, index) -> (((key): getType(value))as Object {class:"org.mule.extension.dynamodb.api.model.AttributeValue"}) ) )  )as Object {class:"org.mule.extension.dynamodb.api.model.WriteRequest"}) 
}