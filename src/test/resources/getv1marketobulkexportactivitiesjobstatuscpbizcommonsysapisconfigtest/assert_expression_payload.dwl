%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  request_id: "26dc#17433d302f5",
  result: [
    {
      export_id: "3a0b1ff0-f1c4-4cd5-a557-7f9159ff751a",
      format: "CSV",
      status: "Completed",
      created_at: "2020-08-27T17:00:12Z",
      finished_at: "2020-08-27T17:12:18Z",
      queued_at: "2020-08-27T17:10:44Z",
      started_at: "2020-08-27T17:11:55Z",
      number_of_records: 0,
      file_size: 21
    }
  ],
  success: true
})