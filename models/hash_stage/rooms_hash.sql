{%- set yaml_metadata -%}
source_model: 'rooms_stage'
derived_columns:
  SOURCE: '!ROOMS_SOURCE'
  load_date: 'TO_TIMESTAMP(''{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S.%f") }}'')'
  ROOMS_NK: 'ROOM_ID'
  COLLISION_KEY: "!DV_DEMO"
hashed_columns:
  ROOMS_HK: 
    - ROOM_ID
    - COLLISION_KEY
  lnk_room_room_types:
    - ROOM_ID
    - ROOMTYPE
  ROOMS_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'ROOMTYPE'
      
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