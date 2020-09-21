%dw 2.0
output application/json
---
{
    errors:[
    {
        transactionId: correlationId,
        errorCode: "APIKIT-404-NOT-FOUND-ERROR",
        errorMessage: "The request was rejected. Resource not found."
    }]
}