{{ config(materialized='table') }}


PIVOT {{ ref('int_findings_text_renamed') }}
ON target_field_name
USING first(findingcodetext)
group by redcap_repeat_instance