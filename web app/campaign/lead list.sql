select a.campaign_id,a.customer_name,a.phone_no,a.Lead_type
from 
(select cmt.campaign_id,slmt.customer_name,slmt.phone_no,
case when slmt.customer_id then 'sale' end as 'Lead_type'
 from campaign_master_tbl cmt 
inner join sales_lead_master_tbl slmt on cmt.campaign_id=slmt.campaign_id and cmt.is_active='Y'
union all
select cmt.campaign_id,plt.lead_name,plt.phone_number,
case when plt.purchase_lead_id then 'Purchase' end as 'Lead_type'
from campaign_master_tbl cmt 
inner join purchase_lead_tbl plt on plt.campaign_id=cmt.campaign_id and plt.is_active='Y')a
where a.campaign_id=6

