select *
from amplitude_events;

-- country
select distinct
"country" as country_name,
hash("country") as country_id
from amplitude_events;

-- region
select distinct
"region" as region_name,
hash("region") as region_id
from amplitude_events;

-- city
select distinct
"city" as city_name,
hash("city") as city_id
from amplitude_events;

-- location
select distinct
hash("ip_address") as location_id,
"ip_address" as ip_address,
hash("city") as city_id,
hash("country") as country_id,
hash("region") as region_id
from amplitude_events;


-- user properties
with json as (Select
    hash("user_properties") as up_id,
    parse_json("user_properties") as parsed_json
from amplitude_events
)

select
    up_id,
    parsed_json:initial_utm_medium::STRING AS initial_utm_medium,
    parsed_json:initial_referring_domain::STRING AS initial_referring_domain,
    parsed_json:initial_utm_campaign::STRING AS initial_utm_campaign,
    parsed_json:referrer::STRING AS referrer,
    parsed_json:initial_utm_source::STRING AS initial_utm_source,
    parsed_json:initial_referrer::STRING AS initial_referrer,
    parsed_json:referring_domain::STRING AS referring_domain
from json;