### Idexx Test
Given conversation in initial interview, decided to take the opportunity to have some fun and highlight dbt and how I think it might be an effective tool to add to the team's stack. This is a very basic project with minimal supporting infrastructure. I used duckDB to power it.

### Part A
- Examining the tables: see analyses -> PART_A__examining_the_tables -> example_examination_queries
- Potential issues: date formatting of go_live in the brand table, null values in opp, trailing whitespaces in material_name, sales region + country could cause issues
  - later learned there is a dupe id in sales_rep table
- relationship: see erd_test.png in this repo (might be up a level). Also see this link:

- SQL join: see models -> part_A -> full_data
  - this is when I noticed the dupe id
    - added test to the model that would fail if such thing happens again to promote data quality

### Part B
- see models -> part_B
- the lost opportunties by reason is split between 2 models (base then pivot) as dbt was not happy putting both in 1 model.


### Part C
- see analyses -> PACT_C__analysis_query -> opportunity_win_rate
- I went down a few different paths and settled on the most interesting quick hit to be the high win rate and high opportunity amount for Service X contracts
  - given timing being equal amongst the different opportunities, it is probably best to prioritize service X contracts. On the other hand, given how low in value migration services are, this offering may want to be dropped or ensure that minimal sales effort is spent to close these deals to protect ROI.