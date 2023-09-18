{{ config(materialized = "table") }}

PIVOT {{ ref('loss_reasons_base') }} ON
opportunity_closed_year
	USING sum(opportunities)