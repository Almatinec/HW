{{
  config(
    materialized='view'
  )
}}

with cpc as
(
    select 
    sum(a.imps)/sum(a.clicks) as VAL, 'CPC' as SCORE
from {{ref("stg_src_ads_bing_all_data")}} a),
cc as(
    select
    sum(b.spend)/sum(b.conv) as VAL, 'Conversion_cost' as SCORE
    from {{ref("stg_src_ads_bing_all_data")}} b),
cpe as( 
    select
    sum(c.spend)/sum(c.clicks) as VAL, 'CPE' as SCORE 
    from {{ref("stg_src_ads_bing_all_data")}} c)
select * from cpc
union all 
select * from cc
union all 
select * from cpe