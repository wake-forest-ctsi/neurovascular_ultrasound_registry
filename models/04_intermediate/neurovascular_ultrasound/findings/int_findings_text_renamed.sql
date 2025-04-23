select
    int_findings_text_split.PerformedProcedureID as redcap_repeat_instance
    , entity_type_mappings.target_field_name
    , int_findings_text_split.FindingCodeText
from
    {{ ref('int_findings_text_split') }}
    inner join {{ ref('entity_type_mappings') }} on entity_type_mappings.source_entity_name || entity_type_mappings.source_value_position = int_findings_text_split.identifier