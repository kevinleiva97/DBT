{%- set source_model = "bookings_hash" -%}
{%- set src_pk = "lnk_bookin_room" -%}
{%- set src_fk = ["BOOKING_ID", "ROOM_NO"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}