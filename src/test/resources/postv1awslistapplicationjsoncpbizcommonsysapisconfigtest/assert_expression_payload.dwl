%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 46,
    "ETag": "95174e182c3393959a809b8c43cec83f",
    "lastModified": "2020-08-25T14:31:30",
    "key": "Encryption"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 46,
    "ETag": "4d0ce133cdaf3b832d120e21b9bde86a",
    "lastModified": "2020-08-28T10:02:27",
    "key": "Encryption.txt"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 0,
    "ETag": "d41d8cd98f00b204e9800998ecf8427e",
    "lastModified": "2020-08-11T15:45:44",
    "key": "Error/"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 1816996,
    "ETag": "fa70dd6bd96ddf2e9cd65f799fcc584d",
    "lastModified": "2020-08-28T15:17:48",
    "key": "Error/marketo_export_chunks_01.gzip"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 0,
    "ETag": "d41d8cd98f00b204e9800998ecf8427e",
    "lastModified": "2020-05-29T10:17:15",
    "key": "Marketo/"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 87530,
    "ETag": "1d4cfc8dc85a88eee566074dc680bec5",
    "lastModified": "2020-05-29T10:17:56",
    "key": "Marketo/region=eu/table=eu_activity/dt=2020-05-29/eu_activity_2020-05-29T23:59:59.786.gzip"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 3471848,
    "ETag": "718ed3134d9ce2bbe567ac02c5ea1ec1",
    "lastModified": "2020-05-29T10:38:34",
    "key": "Marketo/region=na/table=na_activity/dt=2020-05-22/na_activity_2020-05-22T23:59:59.786.gzip"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 0,
    "ETag": "d41d8cd98f00b204e9800998ecf8427e",
    "lastModified": "2020-08-29T13:10:10",
    "key": "NOSData/2020-08-29/"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 0,
    "ETag": "d41d8cd98f00b204e9800998ecf8427e",
    "lastModified": "2020-08-19T22:17:21",
    "key": "Processing/"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 0,
    "ETag": "d41d8cd98f00b204e9800998ecf8427e",
    "lastModified": "2020-08-26T11:05:43",
    "key": "test/"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 0,
    "ETag": "d41d8cd98f00b204e9800998ecf8427e",
    "lastModified": "2020-08-26T11:06:14",
    "key": "test/2020-08-24/"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 2547932,
    "ETag": "c0d8a6b63f0732ee967ee51e703730be",
    "lastModified": "2020-08-26T11:07:19",
    "key": "test/2020-08-24/marketo_export_chunks_4.tsv.gz"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 2458772,
    "ETag": "7115c686259647f71737555975e82bb9",
    "lastModified": "2020-08-26T11:06:14",
    "key": "test/2020-08-24/marketo_export_chunks_8.tsv.gz"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 2382039,
    "ETag": "99aaa79d53b17b3f6fd673e1837be878",
    "lastModified": "2020-08-26T11:06:14",
    "key": "test/2020-08-24/marketo_export_chunks_9.tsv.gz"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 121,
    "ETag": "50bd33141b2e58659b11a28754a80036",
    "lastModified": "2020-08-17T12:42:04",
    "key": "testZip.zip"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 135,
    "ETag": "89f9e4828966e8689c768f327150516b",
    "lastModified": "2020-08-17T16:06:16",
    "key": "testZip1.zip"
  },
  {
    "owner": {
      "displayName": "awsaccount.cp-it",
      "id": "b9a2f25c389104394338d76cac52f366821caf802b8717b5e9651669184936d3"
    },
    "bucketName": "cpedwqa",
    "storageClass": "STANDARD",
    "size": 26,
    "ETag": "6ccb8fac358fea58732ed8ffec85b9f5",
    "lastModified": "2020-08-31T11:02:23",
    "key": "text1.txt"
  }
])