select vmt.vehicle_id,
concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
concat('[','"',vcit.front_view,'"',',','"',vcit.rear_view,'"',',','"',vcit.right_view,'"',',','"',vcit.left_view,'"'']') as images,
vmt.manufactured_year,
vmt.no_of_owners,
vcst.purchased,
vcst.is_refurbished,
vcst.In_showroom,
vcst.token_recieve,
vcst.is_sold
 from invester_vehicle_interest_tbl ivit 
inner join vehicle_master_tbl vmt on ivit.vehicle_id=vmt.vehicle_id and ivit.is_active='Y'
and vmt.is_active='Y'
inner join car_model_master_tbl cmt on vmt.car_make=cmt.car_id  
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model  
left join vehicle_complete_status_tbl vcst on vcst.vehicle_id=vmt.vehicle_id 
inner join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=vmt.vehicle_id
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id
where ivit.invester_id=2
group by ivit.vehicle_id;
