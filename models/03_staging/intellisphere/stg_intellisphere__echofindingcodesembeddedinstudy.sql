
with source as (

    select * from {{ source('intellisphere', 'echofindingcodesembeddedinstudy') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed

