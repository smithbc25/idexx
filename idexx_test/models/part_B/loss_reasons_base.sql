with dataset as (
    select *
    from {{ ref('full_data') }}
),
--sum 2021 opportunity amount for na-west by rep

reason_year as (
    select
        opportunity_result_reason,
        date_part('year', opportunity_closed) as opportunity_closed_year,
        count(distinct opportunity_id) as opportunities
    from dataset
    where
        stage_of_sale = 'Loss'
    group by 1, 2
    order by 1, 2
)

select *
from reason_year
