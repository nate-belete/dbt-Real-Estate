

with housing_inventory as (

    select
    record_period,
    inventory*1000 as housing_units
    from "FRED_DATASET_RAW"."HOUSING"."HOUSING"
)

select * from housing_inventory

