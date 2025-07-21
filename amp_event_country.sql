select distinct
"country" as country_name,
hash("country") as country_id
from amplitude_events;