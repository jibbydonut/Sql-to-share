select distinct
"region" as region_name,
hash("region") as region_id
from amplitude_events;