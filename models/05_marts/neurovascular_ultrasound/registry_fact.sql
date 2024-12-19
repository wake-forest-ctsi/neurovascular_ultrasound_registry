select 
    NULL as record_id
    , 'patient_background_information' as redcap_repeat_instrument
    , NULL as redcap_repeat_instance
    , stg_intellisphere__echostudies.PatientName as name
    , stg_intellisphere__echostudies.DateOfBirth as date_of_birth
    , stg_intellisphere__echostudies.MRN as mrn
    , NULL as gender
    , NULL as race_ethnicity
    , 2 as patient_information_complete
    , stg_intellisphere__echostudies.FormattedProcedureDate as date_of_study
    , stg_intellisphere__echostudies.StudyConfig2 as access
    , NULL as medical_history
    , NULL as diabetes
    , NULL as hypertension
    , NULL as hyperlidemia
    , NULL as smoking_history__1
    , NULL as smoking_history__2
    , NULL as smoking_history__3
    , NULL as smoking_history__4
    , stg_intellisphere__echostudies.EchoREasonForStudy as diagnosis
    , stg_intellisphere__echostudies.SystolicPressure as systolic_1
    , stg_intellisphere__echostudies.DiastolicPressure as diastolic_1
from
    {{ ref('stg_intellisphere__echostudies') }}
    left join {{ ref('stg_intellisphere__echofindingcodesembeddedinstudy') }} on stg_intellisphere__echostudies.PerformedProcedureID = stg_intellisphere__echofindingcodesembeddedinstudy.PerformedProcedureID