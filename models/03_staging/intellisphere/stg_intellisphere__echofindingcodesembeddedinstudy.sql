
with source as (

    select * from {{ source('intellisphere', 'echofindingcodesembeddedinstudy') }}
    where
        cast(echofindingcodesembeddedinstudy.performedprocedureid as bigint) in (select redcap_repeat_instance from {{ ref('stg_intellisphere__echostudies') }} )
),

renamed as (

    select
        source.*
        ,concat(source.findinggroupid, ':',  source.findingcode) as identifier
    from source

)

select * from renamed

