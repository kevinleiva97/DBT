{%- set yaml_metadata -%}
source_model: roomtypes_hash
src_pk: ROOMTYPES_HK
src_hashdiff: ROOMTYPES_HASHDIFF
src_payload:
    - DESCRIPTION
    - CAPACITY
src_ldts: LOAD_DATE
src_source: SOURCE
{%- endset -%}
    
{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                    src_hashdiff=metadata_dict["src_hashdiff"],
                    src_payload=metadata_dict["src_payload"],
                    src_eff=metadata_dict["src_eff"],
                    src_ldts=metadata_dict["src_ldts"],
                    src_source=metadata_dict["src_source"],
                    source_model=metadata_dict["source_model"]) }}

