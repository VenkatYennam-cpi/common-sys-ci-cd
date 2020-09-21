%dw 2.0
output application/json
---
{
	total_count:payload.total_count,
	(file_id: payload.entries[0].id) if(sizeOf(payload.entries) > 0),
	link: if(sizeOf(payload.entries) > 0) (p('box.file.link') ++ (payload.entries.id reduce ($$ ++ $))) else null,
	(size: payload.entries[0].size) if(sizeOf(payload.entries) > 0),
	(created_at: payload.entries[0].created_at) if(sizeOf(payload.entries) > 0)
}