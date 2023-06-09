{%- set source_model = "rooms_hash" -%}
{%- set src_pk = "lnk_room_room_types" -%}
{%- set src_fk = ["ROOM_ID", "ROOMTYPE"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}