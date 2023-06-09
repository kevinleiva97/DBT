{%- set source_model = "rooms_hash" -%}
{%- set src_pk = "ROOMS_HK" -%}
{%- set src_nk = "ROOMS_NK" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}

