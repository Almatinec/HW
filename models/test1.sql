select 
sum(a.spend)/sum(a.clicks) as CPC, 
sum(a.spend)/sum(a.conv) as Conversion_cost, 
sum(a.spend)/sum(a.clicks) as Cost_per_engage, 
from {{ref("src_ads_bing_all_data")}} a