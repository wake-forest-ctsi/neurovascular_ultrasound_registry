
with source as (

    select * from {{ source('intellisphere', 'patient') }}
    where
        patientid in (select record_id from {{ ref('stg_intellisphere__echostudies')}})
),

renamed as (

    select
        *
    from source

)

select * from renamed

