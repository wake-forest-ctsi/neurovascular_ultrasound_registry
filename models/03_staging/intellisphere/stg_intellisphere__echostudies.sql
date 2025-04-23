
with source as (

    select * from {{ source('intellisphere', 'echostudies') }}
    where 
        institution in ('WFUBMC','HPMC','Lexington')
        and (
			StudyConfig3 like '%TRANSCRANIAL%' 
			or StudyConfig3 like '%CAROTID%' 
			or StudyConfig3 like '%TCD%' 
        )
        and ProcedureStartDate < cast('2024-03-01' as date)
),

renamed as (

    select
        PatientID as record_id
        , 'patient_background_information' as redcap_repeat_instrument
        , PerformedProcedureID as redcap_repeat_instance
        , ProcedureStartDate as date_of_study
        , StudyConfig2 as access
        , EchoReasonForStudy as diagnosis
        , SystolicPressure as systolic_1
        , DiastolicPressure as diastolic_1
        , HeartRateBPM as pulse
    from source

)

select * from renamed

