{{
  config(
    materialized = 'incremental'
    )
}}

with comments  as (
    select * 
    from {{ ref('src_airport_comments')}}
    where 
        comment_body is not null
)
select 
    comment_id,
    airport_ident,
    comment_timestamp,
    ifnull(member_nickname,'__UNKNOWN__') AS member_nickname,
    comment_subject,
    comment_body,
    current_timestamp() as loaded_at
from comments c
{% if is_incremental() %}
  where comment_id >= (select max(comment_id) from {{ this }})
{% endif %}