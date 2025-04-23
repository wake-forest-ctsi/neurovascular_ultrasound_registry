select
    stg_intellisphere__patient.*
from
    {{ ref('stg_intellisphere__patient')}} 
where
    stg_intellisphere__patient.patientid in
        (select cast(patientid as bigint) from {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy')}})