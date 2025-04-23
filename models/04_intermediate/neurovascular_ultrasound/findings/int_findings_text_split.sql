with combined_findingcodes as (
    select distinct
        source_entity_name
    from
        {{ ref('entity_type_mappings') }}
    where
        source_table_name = 'EchoFindingCodesEmbeddedInStudy'
        and source_value_position is not null
) 
,
/* clean the values */
extracted as 
(select 
    stg_intellisphere__echofindingcodesembeddedinstudy.*
    , regexp_extract(stg_intellisphere__echofindingcodesembeddedinstudy.FindingCodeText, '([\d\.]+)/([\d\.]+)/([\d\.]+)') as matched
from
    {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy') }}
    inner join combined_findingcodes on combined_findingcodes.source_entity_name = stg_intellisphere__echofindingcodesembeddedinstudy.identifier
),
/* split the values into a list */
split as 
(
    select
        extracted.*
        , regexp_extract_all(extracted.matched, '[\d\.]+') as matched_list
    from
        extracted
),
/* unnest the list into rows */
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
    performedprocedureid
    , unnested.FindingCode || unnested.index as FindingCode
    , unnested.value as FindingCodeText
    , unnested.FindingGroupID || ':' || unnested.FindingCode || unnested.index as identifier
from
    unnested