with stg_titleauthor as (select * from {{ source("pubs", "titleauthor") }})
select
    {{ dbt_utils.generate_surrogate_key(["ta.au_id"]) }} as titleauthorkey,
    ta.au_id,
    ta.title_id,
    ta.au_ord,
    ta.royaltyper
from stg_titleauthor ta