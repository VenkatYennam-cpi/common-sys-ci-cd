%dw 2.0
output application/json
---
{
    errors:[
    {
        transactionId: correlationId,
        errorCode: "APIKIT-501-NOT-IMPLEMENTED-ERROR",
        errorMessage: "Encountered an error while processing a lead request. Not implemented error"
    }]
}