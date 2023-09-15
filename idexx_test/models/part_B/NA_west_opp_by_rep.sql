with dataset as (
    select *
    from {{ ref('full_data') }}
),
--sum 2021 opportunity amount for na-west by rep

opp_by_rep as (
    select
        name,
        sum(opportunity_amount) as amount
    from dataset
    where
        date_part('year', opportunity_closed) = 2021
        and sales_country in ('United States', 'Canada')
        and sales_region = 'west'
        and stage_of_sale = 'Win'  --ASSUMPTION: we only want wins.
    group by 1
)

select *
from opp_by_rep
