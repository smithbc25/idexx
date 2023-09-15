------count(*) example-----
select count(*)
from {{ ref('tbl_brand') }}
limit 10;

--select * example----
select *
from {{ ref('tbl_opp') }}
limit 100;


--select distinct example
select distinct material_name
from {{ ref('tbl_product') }}


--date range example
select min(opportunity_created), max(opportunity_created)
from {{ ref('tbl_opp') }}



---while making full_data - noticed dupes
select count(*)
from {{ ref('tbl_opp') }}

select count(*)
from {{ ref('full_data') }}

--used qualify to determine cause - two reps with same ID
SELECT *
from {{ ref('full_data') }}
qualify count(*) over (partition by opportunity_id) > 1