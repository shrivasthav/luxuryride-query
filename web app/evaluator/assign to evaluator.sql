select vmt.vehicle_id,plt.lead_name,plt.phone_number,plt.location_area_city,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
vmt.vehicle_no,emt.first_name as evaluator_name,      
CONCAT(date(evat.confirmed_on),' ',TIME_FORMAT(evat.confirmed_on, '%h:%i:%s %p')) AS date_evaluate
from purchase_lead_tbl plt inner join vehicle_master_tbl vmt on plt.purchase_lead_id=vmt.purchase_lead_id and plt.is_active='Y'
and vmt.is_active='Y'
inner join evaluator_vehicle_assignment_tbl evat on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y'
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id
where evat.is_active='Y' and evat.is_confirmed='Y' and evat.is_rejected='N' and evat.is_submitted='N'
group by plt.purchase_lead_id
order by evat.confirmed_on desc
