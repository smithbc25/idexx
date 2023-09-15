{{ config(materialized = "view") }}


with brand as (
    select *
    from {{ ref('tbl_brand') }}
),

customer as (
    select *
    from {{ ref('tbl_customer') }}
),

opp as (
    select *
    from {{ ref('tbl_opp') }}
),

product as (
    select *
    from {{ ref('tbl_product') }}
),

sales_rep as (
    select *
    from {{ ref('tbl_sales_rep') }}
),

total_join as (
    select *
    from opp
    left join brand
        on opp.brand_id = brand.brand_id
    left join customer
        on opp.cus_id = customer.cus_id
    left join product
        on opp.material_num = product.material_num
    left join sales_rep
        on opp.emp_id = sales_rep.emp_id
)

select *
from total_join
