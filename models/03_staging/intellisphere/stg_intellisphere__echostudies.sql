
with source as (

    select * from {{ source('intellisphere', 'echostudies') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed

