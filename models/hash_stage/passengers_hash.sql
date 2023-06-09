{%- set yaml_metadata -%}
source_model: 'passengers_stage'
derived_columns:
  SOURCE: '!PASSENGER_SOURCE'
  load_date: 'TO_TIMESTAMP(''{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S.%f") }}'')'
  PASSENGER_NK: 'PASSENGER_ID'
  COLLISION_KEY: "!DV_DEMO"
hashed_columns:
  PASSENGER_HK: 
    - PASSENGER_ID
    - COLLISION_KEY
  PASSENGER_HASHDIFF:
    is_hashdiff: true
    columns:

      - 'NAME'
      
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

WITH staging AS (
{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}
)

SELECT *
FROM staging