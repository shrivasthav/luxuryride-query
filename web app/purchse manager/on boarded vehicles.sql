select vmt.vehicle_id,plt.lead_name,plt.phone_number,ct.city,concat(cmt.car_make,'-',vfdt.car_model) as vehicle_name,
vmt.vehicle_no,pvdt.selling_price,pvdt.owned_on
from purchased_vehicle_details_tbl pvdt inner join vehicle_master_tbl vmt on vmt.vehicle_id=pvdt.vehicle_id and pvdt.is_active='Y'
inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join city_master_tbl ct on ct.city_id=vmt.city 
where pvdt.onboard_id=2
group by pvdt.vehicle_id;