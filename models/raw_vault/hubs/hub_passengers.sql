{%- set source_model = "passengers_hash" -%}
{%- set src_pk = "PASSENGER_HK" -%}
{%- set src_nk = "PASSENGER_NK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}