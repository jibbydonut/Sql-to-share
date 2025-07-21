select distinct
"city" as city_name,
hash("city") as city_id
from amplitude_events;
