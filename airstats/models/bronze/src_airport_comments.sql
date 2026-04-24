{{
  config(
    materialized = 'ephemeral',
    )
}}


with raw_comments as (
        select * from {{ source('airstats', 'comments') }}
  ),
  renamed as (
      select
        {{ adapter.quote("ID") }} as comment_id,
        {{ adapter.quote("AIRPORT_IDENT") }},
        {{ adapter.quote("DATE") }} as comment_timestamp,
        {{ adapter.quote("MEMBER_NICKNAME") }},
        {{ adapter.quote("SUBJECT") }} as comment_subject,
        {{ adapter.quote("BODY") }} as comment_body

      from raw_comments
  )
  select * from renamed
    