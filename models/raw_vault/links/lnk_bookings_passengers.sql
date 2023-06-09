{%- set source_model = "bookings_hash" -%}
{%- set src_pk = "lnk_booking_passenger" -%}
{%- set src_fk = ["BOOKING_ID", "PASSENGER_ID"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}