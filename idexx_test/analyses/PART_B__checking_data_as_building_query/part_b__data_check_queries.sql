--checking if canada and US both have west as a region
select distinct sales_country, sales_region
from {{ ref('full_data') }}
order by 1

--checking which stages reach closed
select distinct stage_of_sale
from {{ ref('full_data') }}
where OPPORTUNITY_CLOSED is not null


--found and investigated dupes
--see test