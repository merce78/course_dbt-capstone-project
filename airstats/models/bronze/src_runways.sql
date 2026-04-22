with raw_runways as (
        select * from {{ source('airstats', 'runways') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }} as runway_id,
        {{ adapter.quote("AIRPORT_IDENT") }} as airport_ident,
        {{ adapter.quote("LENGTH_FT") }} as runway_length_ft,
        {{ adapter.quote("WIDTH_FT") }} as runway_width_ft,
        {{ adapter.quote("SURFACE") }} as runway_surface,
        {{ adapter.quote("LIGHTED") }} as runway_lighted,
        {{ adapter.quote("CLOSED") }} as runway_closed
      from raw_runways
  )
  select * from renamed
    