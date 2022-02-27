

with housing_dates as (
select distinct 
  record_period as period
 from "FRED_DATASET_RAW"."HOUSING"."HOUSING"
)

,population_dates as (
select distinct 
  record_period as period
 from "FRED_DATASET_RAW"."POPULATION"."POPULATION"
)

,dates_all as (
select period from housing_dates
union 
  select period from population_dates
)

,data_to_use as (
select period from dates_all
  where period in (select * from housing_dates)
  and period in (select * from population_dates)
 order by 1
  
)

select * from data_to_use