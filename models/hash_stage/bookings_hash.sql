{%- set yaml_metadata -%}
source_model: 'bookings_stage'
derived_columns:
  SOURCE: '!BOOKINGS_SOURCE'
  load_date: 'TO_TIMESTAMP(''{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S.%f") }}'')'
  BOOKINGS_NK: 'BOOKING_ID'
  COLLISION_KEY: "!DV_DEMO"
hashed_columns:
  BOOKINGS_HK: 
    - BOOKING_ID
    - COLLISION_KEY
  BOOKINGS_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'FROMDATE'
      - 'TODATE'
      - 'PASSENGER_ID'
      - 'ROOM_NO'
      - 'PERSONS_QTY'
      
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