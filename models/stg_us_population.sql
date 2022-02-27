
with us_population as (

    select
    record_period,
    population*1000 as us_population
    from "FRED_DATASET_RAW"."POPULATION"."POPULATION"
)

select * from us_population

