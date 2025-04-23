select
    int_findings_checkbox_renamed.redcap_repeat_instance
    , int_findings_checkbox_renamed.target_field_name
    , case
        when int_findings_checkbox_renamed.FindingCodeText is not null then 1
      end as target_field_value
from
    {{ ref('int_findings_checkbox_renamed') }}