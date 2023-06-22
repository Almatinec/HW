{{
  config(
    materialized='view'
  )
}}

with FBIMP as (
    select sum(a.impressions) as impressions,'FB' as channel,sum(a.spend)/sum(a.clicks) as CPC 
    from {{ ref('stg_src_ads_creative_facebook_all_data') }} a
    ),
TKIMPT as (
    select sum(b.impressions) as impressions,'TK' as channel,sum(b.spend)/sum(b.clicks) as CPC
    from {{ ref('stg_src_ads_tiktok_ads_all_data') }} b
    ),
TWIMPT as (
    select sum(c.impressions) as impressions,'TW' as channel,sum(c.spend)/sum(c.clicks) as CPC 
    from {{ ref('stg_src_promoted_tweets_twitter_all_data') }} c )
select * from FBIMP
union all 
select * from TKIMPT
union all 
select * from TWIMPT