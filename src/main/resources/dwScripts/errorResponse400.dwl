%dw 2.0
output application/json
---
{
    errors:[
    {
        transactionId: correlationId,
        errorCode: "APIKIT-400-DATA-ERROR",
        errorMessage: vars.errorDescription
    }]
}