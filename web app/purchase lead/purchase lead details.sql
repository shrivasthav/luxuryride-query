select 
a.vehicle_id,a.lead_name,a.lead_name,a.location_area_city,a.vehicle_name,
CONCAT(date(a.date_evaluate),' ',TIME_FORMAT(a.date_evaluate, '%h:%i:%s %p')) AS date_evaluate,
a.expected_selling_price
from 
(select vmt.vehicle_id,plt.lead_name,plt.phone_number,plt.location_area_city,concat(vmt.car_make,' - ',vmt.car_model) as vehicle_name,
case when evat.is_active='Y' and is_confirmed='N' then evat.confirmed_on
     when evat.is_active='Y' and is_confirmed='Y' then evat.confirmed_on end as date_evaluate,
ifnull(vmt.expected_selling_price,'-') as expected_selling_price
from purchase_lead_tbl plt inner join vehicle_master_tbl vmt on plt.purchase_lead_id=vmt.purchase_lead_id and plt.is_active='Y'
and vmt.is_active='Y'
inner join evaluator_vehicle_assignment_tbl evat on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y' 
group by plt.purchase_lead_id)a
order by a.date_evaluate desc
