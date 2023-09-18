select
    OPPORTUNITY_NAME,
    MATERIAL_NAME,
    count(distinct case when STAGE_OF_SALE = 'Win' then OPPORTUNITY_ID end)
    / count(distinct OPPORTUNITY_ID) as WIN_RATE,
    avg(datediff('day', OPPORTUNITY_CREATED, OPPORTUNITY_CLOSED)),
    count(distinct OPPORTUNITY_ID) as OPPS,
    avg(OPPORTUNITY_AMOUNT) as AMOUNT
from {{ ref('full_data') }}
group by 1, 2
order by 3 desc;






---other dead ends
select
    datetrunc('quarter', OPPORTUNITY_CREATED) as CREATE_MONTH,
    PRIMARY_ADDON,
    count(distinct case when STAGE_OF_SALE = 'Win' then OPPORTUNITY_ID end)
    / count(distinct OPPORTUNITY_ID) as WIN_RATE,
    avg(datediff('day', OPPORTUNITY_CREATED, OPPORTUNITY_CLOSED)),
    count(distinct OPPORTUNITY_ID) as OPPS,
    avg(OPPORTUNITY_AMOUNT) as AMOUNT
from {{ ref('full_data') }}
group by 1, 2
order by 2, 1;


select
    datetrunc('quarter', OPPORTUNITY_CREATED),
    PRACTICE_CLASS_DESC,
    sum(OPPORTUNITY_AMOUNT),
    count(distinct OPPORTUNITY_ID)
from {{ ref('full_data') }}
group by 1, 2
order by 2, 1;
