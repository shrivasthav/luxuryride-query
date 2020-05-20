select vmt.vehicle_id,plt.lead_name,plt.phone_number,vmt.vehicle_no,emt.first_name,
CONCAT(date(pvdt.owned_on),' ',TIME_FORMAT(pvdt.owned_on, '%h:%i:%s %p')) as updated_on
from purchased_vehicle_details_tbl pvdt inner join vehicle_master_tbl vmt on vmt.vehicle_id=pvdt.vehicle_id and vmt.is_active='Y'
and pvdt.is_active='Y'
inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id 
inner join evaluator_vehicle_assignment_tbl evat on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y'
inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id 
where pvdt.onboard_id=3
group by pvdt.vehicle_id;