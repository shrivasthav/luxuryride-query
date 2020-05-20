select 
vmt.vehicle_id,plt.lead_name,plt.phone_number,plt.location_area_city, concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
vmt.expected_selling_price,
CONCAT(date(vmt.added_on),' ',TIME_FORMAT(vmt.added_on, '%h:%i:%s %p')) AS registered_on
 from purchase_lead_tbl plt inner join vehicle_master_tbl vmt on plt.purchase_lead_id=vmt.purchase_lead_id 
and plt.is_active='Y' and vmt.is_active='Y'
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make 
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where vmt.vehicle_id not in 
(select vehicle_id from evaluator_vehicle_assignment_tbl where is_active='Y')
and plt.migrated_from is null
group by plt.purchase_lead_id;