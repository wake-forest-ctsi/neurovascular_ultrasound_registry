
with unioned as (
select * from {{ ref('int_demographics_renamed') }}
union all by name
select * from {{ ref('int_findings_joined') }}
)

select
    *
from
    unioned
order by
    record_id, patient_information_complete, redcap_repeat_instance