select plt.lead_name,plt.phone_number,plt.email_id,plt.address_line_1,plt.location_area_city, plt.district,smt.state,plt.pincode,
plst.source_name,vmt.vehicle_type, vmt.car_make,vmt.car_model,vmt.vehicle_varient,vmt.color,vmt.vehicle_no,vmt.fuel_type,vmt.manufactured_year,
vmt.no_of_owners,vmt.odometer,vmt.vehicle_condition,emt.first_name,
CONCAT(date(evat.confirmed_on),' ',TIME_FORMAT(evat.confirmed_on, '%h:%i:%s %p')) AS date_evaluate,
evat.location
from purchase_lead_tbl plt 
inner join vehicle_master_tbl vmt on plt.purchase_lead_id=vmt.purchase_lead_id and plt.is_active='Y'
and vmt.is_active='Y'
left join state_master_tbl smt on smt.state_id=plt.state and smt.is_active='Y'
inner join purchase_lead_source_tbl plst on plst.source_id=plt.lead_source and plst.is_active='Y'
left join evaluator_vehicle_assignment_tbl evat on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y'
inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id and emt.is_active='Y'
where plt.purchase_lead_id=1;
