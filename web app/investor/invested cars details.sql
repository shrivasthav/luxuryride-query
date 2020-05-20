select ivit.vehicle_id,
concat('[','"',vcit.front_view,'"',',','"',vcit.rear_view,'"',',','"',vcit.right_view,'"',',','"',vcit.left_view,'"'']') as images,
concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
vmt.vehicle_no,(pvdt.purchase_price+pvdt.refurbish_amount) as  price,vmt.no_of_owners,
case when vcst.purchased='Y' and vcst.is_refurbished='N'and vcst.In_showroom='N'and vcst.token_recieve='N'and vcst.is_sold='N' then 'purchased'
    when vcst.purchased='Y'and vcst.is_refurbished='Y'and vcst.In_showroom='N' and vcst.token_recieve='N' and vcst.is_sold='N' then 'refurbished'
     when vcst.purchased='Y'and vcst.is_refurbished='Y'and vcst.In_showroom='Y'and vcst.token_recieve='N'and vcst.is_sold='N' then 'showroom'
     when vcst.purchased='Y' and vcst.is_refurbished='Y'and vcst.In_showroom='Y'and vcst.token_recieve='Y'and vcst.is_sold='N' then 'tocken_recieved'
     when vcst.purchased='Y' and vcst.is_refurbished='Y'and vcst.In_showroom='Y'and vcst.token_recieve='Y'and vcst.is_sold='Y' then 'sold'
     else 'Under process' end as status,
     count(distinct ect.customer_id) as leads
     
from invester_vehicle_interest_tbl ivit inner join vehicle_master_tbl vmt on ivit.vehicle_id=vmt.vehicle_id
and ivit.is_active='Y'
inner join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=vmt.vehicle_id and pvdt.is_active='Y'
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
left join vehicle_complete_status_tbl vcst on vcst.vehicle_id=vmt.vehicle_id and vcst.is_active='Y'
left join enquired_cars_tbl ect on ect.vehicle_id=vmt.vehicle_id 
where ivit.invester_id=2
group by ivit.vehicle_id;