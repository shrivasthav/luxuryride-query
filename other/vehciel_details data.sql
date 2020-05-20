select plt.lead_name,plt.phone_number,plt.email_id,plt.address_line_1,plt.location_area_city,st.state,plt.district,plt.pincode,pt.source_name,
vv.varient_name,vt.car_type,cmt.car_make,vfdt.car_model,plt.registration_no,vmt.vehicle_condition,plt.manufactured_year,plt.colour,
plt.fuel_type,plt.no_of_owners,plt.odometer,plt.expected_price,plt.purchase_by
 from purchase_lead_tbl plt inner join vehicle_master_tbl vmt on plt.purchase_lead_id=vmt.purchase_lead_id 
left join car_model_master_tbl cmt on cmt.car_make=plt.car_make
left join state_master_tbl st on st.state_id=plt.state
left join vehicle_full_details_tbl vfdt on vfdt.model_id=plt.car_model
left join vehicle_type_master_tbl vt on vt.car_type_id=plt.vehicle_type
left join purchase_lead_source_tbl pt on pt.source_id=plt.lead_source
left join vehicle_varient_master_tbl vv on vv.varient_id=plt.vehicle_variant
where vmt.vehicle_id not in  (select vehicle_id from evaluator_vehicle_assignment_tbl  where is_active='Y')
group by plt.purchase_lead_id