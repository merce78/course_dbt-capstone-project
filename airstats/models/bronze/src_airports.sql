with raw_airports as (
        select * from {{ source('airstats', 'airports') }}
  ),
  renamed as (
      select
        {{ adapter.quote("IDENT") }} as airport_ident,
        {{ adapter.quote("TYPE") }} as airport_type,
        {{ adapter.quote("NAME") }} as airport_name,
        {{ adapter.quote("LATITUDE_DEG") }} as airport_lat,
        {{ adapter.quote("LONGITUDE_DEG") }} as airport_long,
        {{ adapter.quote("CONTINENT") }},
        {{ adapter.quote("ISO_COUNTRY") }},
        {{ adapter.quote("ISO_REGION") }}       

      from raw_airports
  )
  select * from renamed
    