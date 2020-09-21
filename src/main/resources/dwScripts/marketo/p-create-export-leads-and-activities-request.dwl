%dw 2.0
output application/json
---
if (attributes.requestPath contains "leads"){
    fields: payload.fields,
    (format: payload.format) if( not (isEmpty(payload.format))),
    (columnHeaderNames : payload.column_header_names) if( not (isEmpty(payload.column_header_names))),
    filter: {
        (createdAt : {
            (startAt : payload.filter.created_at.start_at) if( not (isEmpty(payload.filter.created_at.start_at))),
            (endAt : payload.filter.created_at.end_at) if( not (isEmpty(payload.filter.created_at.end_at)))
        }) if( not (isEmpty(payload.filter.created_at))),
        (updatedAt : {
            (startAt : payload.filter.updated_at.start_at) if( not (isEmpty(payload.filter.updated_at.start_at))),
            (endAt : payload.filter.updated_at.end_at) if( not (isEmpty(payload.filter.updated_at.end_at)))
        }) if( not (isEmpty(payload.filter.updated_at))),
        (smartListId : payload.filter.smart_list_id) if( not (isEmpty(payload.filter.smart_list_id))),
        (smartListName : payload.filter.smart_list_name) if( not (isEmpty(payload.filter.smart_list_name))),
        (staticListId  : payload.filter.static_list_id) if( not (isEmpty(payload.filter.static_list_id))),
        (staticListName : payload.filter.static_list_name) if( not (isEmpty(payload.filter.static_list_name)))


    }
} else {
    format : payload.format,
    (fields: payload.fields) if( not (isEmpty(payload.fields))),
    (columnHeaderNames : payload.column_header_names) if( not (isEmpty(payload.column_header_names))),
    filter : {
        createdAt : {
            (startAt : payload.filter.created_at.start_at) if( not (isEmpty(payload.filter.created_at.start_at))),
            (endAt : payload.filter.created_at.end_at) if( not (isEmpty(payload.filter.created_at.end_at)))

        },
        (activityTypeIds : payload.filter.activity_type_ids) if(not (isEmpty(payload.filter.activity_type_ids)))
    }

}