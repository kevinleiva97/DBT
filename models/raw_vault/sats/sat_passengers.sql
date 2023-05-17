{%- set source_model = "passengers_hash" -%}
{%- set src_pk = "PASSENGER_HK" -%}
{%- set src_hashdiff = "PASSENGER_HASHDIFF" -%}
{%- set src_payload = ["NAME"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}