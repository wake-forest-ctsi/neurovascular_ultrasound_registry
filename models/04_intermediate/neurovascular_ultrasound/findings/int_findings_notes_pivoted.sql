{{ config(materialized='table') }}


PIVOT {{ ref('int_findings_notes_concatenated') }}
ON target_field_name
USING first(target_field_value)
group by redcap_repeat_instance