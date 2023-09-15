{{ config(materialized = "table") }}

PIVOT {{ ref('loss_reasons') }} ON
opportunity_closed_year
	USING sum(opportunities)