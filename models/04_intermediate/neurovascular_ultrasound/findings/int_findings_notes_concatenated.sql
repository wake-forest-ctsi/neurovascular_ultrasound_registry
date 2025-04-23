select
    int_findings_notes_renamed.redcap_repeat_instance
    , int_findings_notes_renamed.target_field_name
    , string_agg(int_findings_notes_renamed.FindingCodeText, chr(10) ORDER BY int_findings_notes_renamed.source_sequence_value DESC) as target_field_value
from
    {{ ref('int_findings_notes_renamed') }}
    inner join {{ ref('entity_type_mappings') }} on entity_type_mappings.target_field_name = int_findings_notes_renamed.target_field_name
        and entity_type_mappings.source_sequence_value = int_findings_notes_renamed.source_sequence_value
group by
    int_findings_notes_renamed.redcap_repeat_instance
    , int_findings_notes_renamed.target_field_name