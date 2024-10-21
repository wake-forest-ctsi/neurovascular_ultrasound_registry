with extracted as 
(select 
    stg_intellisphere__echofindingcodesembeddedinstudy.*
    , regexp_extract(stg_intellisphere__echofindingcodesembeddedinstudy.FindingCodeText, '([\d\.]+)/([\d\.]+)/([\d\.]+)') as matched
from
    {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy') }}
    inner join {{ ref('overloaded_findingcodes') }} on overloaded_findingcodes.FindingCode = stg_intellisphere__echofindingcodesembeddedinstudy.FindingCode
),
split as 
(
    select
        extracted.*
        , regexp_extract_all(extracted.matched, '[\d\.]+') as matched_list
    from
        extracted
),
unnested as 
(
    select
        split.*
        , unnest(split.matched_list) as value
        , generate_subscripts(split.matched_list, 1) as index
    from
        split
)
select
    {{ dbt_utils.star(from=ref('stg_intellisphere__echofindingcodesembeddedinstudy'), except=['FindingCode','FindingCodeText']) }}
    , unnested.FindingCode || '-' || unnested.index as FindingCode
    , unnested.value as FindingCodeText
from
    unnested

union all

select
    {{ dbt_utils.star(from=ref('stg_intellisphere__echofindingcodesembeddedinstudy'), except=['FindingCode','FindingCodeText']) }}
    , stg_intellisphere__echofindingcodesembeddedinstudy.FindingCode
    , stg_intellisphere__echofindingcodesembeddedinstudy.FindingCodeText
from
    {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy') }}
    left join {{ ref('overloaded_findingcodes') }} on overloaded_findingcodes.FindingCode = stg_intellisphere__echofindingcodesembeddedinstudy.FindingCode
where
    overloaded_findingcodes.FindingCode is null