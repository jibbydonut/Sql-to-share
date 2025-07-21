select distinct
hash("ip_address") as location_id,
"ip_address" as ip_address,
hash("city") as city_id,
hash("country") as country_id,
hash("region") as region_id
from amplitude_events;