with stg_roysched as (select * from {{ source("pubs", "roysched") }})
select
    {{ dbt_utils.generate_surrogate_key(["r.title_id","r.royalty"]) }} as royschedkey,
    r.title_id,
    r.lorange,
    r.hirange,
    r.royalty
from stg_roysched r