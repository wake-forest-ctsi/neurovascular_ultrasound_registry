select 
    *
from
    {{ ref('stg_intellisphere__echostudies') }}
    left join {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy') }} on stg_intellisphere__echostudies.PerformedProcedureID = stg_intellisphere__echofindingcodesembeddedinstudy.PerformedProcedureID