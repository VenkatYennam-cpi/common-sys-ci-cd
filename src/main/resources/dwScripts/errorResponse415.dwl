%dw 2.0
output application/json
---
{
    errors:[
    {
        transactionId: correlationId,
        errorCode: "APIKIT-415-UNSUPPORTED-MEDIATYPE-ERROR",
        errorMessage: "Encountered an error while processing a lead request. Unsupported media type"
    }]
}