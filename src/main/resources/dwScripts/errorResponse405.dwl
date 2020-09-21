%dw 2.0
output application/json
---
{
    errors:[
    {
        transactionId: correlationId,
        errorCode: "APIKIT-405-MOETHOD-NOT-ALLOWED-ERROR",
        errorMessage: "The request was rejected. Method is not Allowed."
    }]
}
