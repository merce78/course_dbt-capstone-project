with runways as (
    
    select           
        runway_id,
        airport_ident,
        runway_length_ft,
        runway_width_ft,
        ifnull(runway_surface,'__UNKNOWN__') as runway_surface,
        runway_lighted,
        runway_closed
    from {{ ref('src_runways')}} as r

)
select *
from runways