select
    stg_intellisphere__echostudies.*
    , {{ dbt_utils.star(from=ref('int_findings_text_pivoted'), except=['redcap_repeat_instance']) }}
    , {{ dbt_utils.star(from=ref('int_findings_radio_pivoted'), except=['redcap_repeat_instance']) }}
    , {{ dbt_utils.star(from=ref('int_findings_checkbox_pivoted'), except=['redcap_repeat_instance']) }}
    , {{ dbt_utils.star(from=ref('int_findings_notes_pivoted'), except=['redcap_repeat_instance']) }}
from
    {{ ref('stg_intellisphere__echostudies') }}
    left join {{ ref('int_findings_text_pivoted') }} on int_findings_text_pivoted.redcap_repeat_instance = stg_intellisphere__echostudies.redcap_repeat_instance
    left join {{ ref('int_findings_radio_pivoted') }} on int_findings_radio_pivoted.redcap_repeat_instance = stg_intellisphere__echostudies.redcap_repeat_instance
    left join {{ ref('int_findings_checkbox_pivoted') }} on int_findings_checkbox_pivoted.redcap_repeat_instance = stg_intellisphere__echostudies.redcap_repeat_instance
    left join {{ ref('int_findings_notes_pivoted') }} on int_findings_notes_pivoted.redcap_repeat_instance = stg_intellisphere__echostudies.redcap_repeat_instance