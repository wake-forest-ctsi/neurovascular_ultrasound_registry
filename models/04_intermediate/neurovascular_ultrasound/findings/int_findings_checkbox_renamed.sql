with entity_names as (
    select distinct
        target_field_name
        , source_entity_name
        , source_field_value
    from
        {{ ref('entity_type_mappings') }}
    where
        target_field_type = 'checkbox'
        and source_table_name = 'EchoFindingCodesEmbeddedInStudy'
)

select
    stg_intellisphere__echofindingcodesembeddedinstudy.PerformedProcedureID as redcap_repeat_instance
    , entity_names.target_field_name
    , stg_intellisphere__echofindingcodesembeddedinstudy.FindingCodeText
from
    {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy') }}
    inner join entity_names on entity_names.source_entity_name = stg_intellisphere__echofindingcodesembeddedinstudy.identifier
        and entity_names.source_field_value = stg_intellisphere__echofindingcodesembeddedinstudy.FindingCodeText