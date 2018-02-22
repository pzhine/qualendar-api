json.id event.id
json.title event.title
json.location event.location
json.startsAt (event.starts_at.to_f * 1000).to_i
json.isAllDay event.all_day
json.duration event.duration.to_f
