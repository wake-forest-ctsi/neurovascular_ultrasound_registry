select
    int_findings_radio_renamed.redcap_repeat_instance
    , int_findings_radio_renamed.target_field_name
    , entity_type_mappings.target_field_value
from
    {{ ref('int_findings_radio_renamed') }}
    inner join {{ ref('entity_type_mappings') }} on entity_type_mappings.target_field_name = int_findings_radio_renamed.target_field_name
        and entity_type_mappings.source_field_value = int_findings_radio_renamed.FindingCodeText