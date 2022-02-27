{{ config (
    materialized="table"
)}}

with real_estate_econ as (

    select 
        dates.period,
        us_housing.housing_units, 
        us_population.us_population, 
        us_population.us_population / 2 as units_needed

    from {{ ref('stg_dates')}} as dates
    left join {{ ref('stg_housing_inventory')}} as us_housing
    on period = us_housing.record_period
    left join {{ ref('stg_us_population')}} as us_population
    on period = us_population.record_period
)

, units_needed as (
    select 
    *,
    housing_units - units_needed as housing_gap

    from real_estate_econ
)

select * from units_needed