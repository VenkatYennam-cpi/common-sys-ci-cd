%dw 2.0
output application/json
---
payload map {
  "created_week": $.week,
  "ticket_number": $.tick_num,
  "mac_address": $.mac,
  "station_serial_num": $.sn,
  "evse_id": $.evse_id,
  "station_model": $.model_int,
  "station_model_detail": $.model_detail,
  "issue": $.issue,
  "sent": $.sent,
  "rma_num": $.rma_num,
  "fso_num": $.fso_num,
  "ticket_type": $.tick_type,
  "cause_code": $.cause_code,
  "part_num": $.part_num,
  "part_serial_num": $.part_sn
  
}