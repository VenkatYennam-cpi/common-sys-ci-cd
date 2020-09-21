%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "total_count": 1,
  "entries": [
    {
      "type": "folder",
      "id": "89765502228",
      "sequence_id": "0",
      "etag": "0",
      "name": "temp2",
      "created_at": "2019-10-11T02:41:35-07:00",
      "modified_at": "2019-11-06T00:24:07-08:00",
      "description": "",
      "size": 25525,
      "path_collection": {
        "total_count": 1,
        "entries": [
          {
            "type": "folder",
            "id": "0",
            "sequence_id": null,
            "etag": null,
            "name": "All Files"
          }
        ]
      },
      "created_by": {
        "type": "user",
        "id": "10262717429",
        "name": "Sreekari D",
        "login": "sreekari.dronamraju@apisero.com"
      },
      "modified_by": {
        "type": "user",
        "id": "10262717429",
        "name": "Sreekari D",
        "login": "sreekari.dronamraju@apisero.com"
      },
      "trashed_at": null,
      "purged_at": null,
      "content_created_at": "2019-10-11T02:41:35-07:00",
      "content_modified_at": "2019-11-06T00:24:07-08:00",
      "owned_by": {
        "type": "user",
        "id": "10262717429",
        "name": "Sreekari D",
        "login": "sreekari.dronamraju@apisero.com"
      },
      "shared_link": null,
      "folder_upload_email": null,
      "parent": {
        "type": "folder",
        "id": "0",
        "sequence_id": null,
        "etag": null,
        "name": "All Files"
      },
      "item_status": "active"
    }
  ],
  "limit": 30,
  "offset": 0
})