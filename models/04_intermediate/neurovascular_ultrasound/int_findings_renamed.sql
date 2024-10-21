select
    int_findings_split.*
    , finding_code_mappings.Field_Name
from
    {{ ref('int_findings_split') }}
    left join {{ ref('finding_code_mappings') }} on finding_code_mappings.FindingCode = int_findings_split.FindingCode
        and finding_code_mappings.findinggroupid = int_findings_split.findinggroupid