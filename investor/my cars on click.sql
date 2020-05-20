select vmt.vehicle_id,
concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
concat('[','"',vcit.front_view,'"',',','"',vcit.rear_view,'"',',','"',vcit.right_view,'"',',','"',vcit.left_view,'"'']') as images,
(pvdt.purchase_price+pvdt.refurbish_amount) as  price,
case when vcst.purchased='Y' and vcst.is_refurbished='N'and vcst.In_showroom='N'and vcst.token_recieve='N'and vcst.is_sold='N' then 'purchased'
    when vcst.purchased='Y'and vcst.is_refurbished='Y'and vcst.In_showroom='N' and vcst.token_recieve='N' and vcst.is_sold='N' then 'refurbished'
     when vcst.purchased='Y'and vcst.is_refurbished='Y'and vcst.In_showroom='Y'and vcst.token_recieve='N'and vcst.is_sold='N' then 'showroom'
     when vcst.purchased='Y' and vcst.is_refurbished='Y'and vcst.In_showroom='Y'and vcst.token_recieve='Y'and vcst.is_sold='N' then 'tocken_recieved'
     when vcst.purchased='Y' and vcst.is_refurbished='Y'and vcst.In_showroom='Y'and vcst.token_recieve='Y'and vcst.is_sold='Y' then 'sold'
     else 'Under process' end as status
from invester_vehicle_interest_tbl ivit 
inner join vehicle_master_tbl vmt on ivit.vehicle_id=vmt.vehicle_id and ivit.is_active='Y'
and vmt.is_active='Y'
inner join car_model_master_tbl cmt on vmt.car_make=cmt.car_id  
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model  
inner join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=vmt.vehicle_id and pvdt.is_active='Y'
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id
left join vehicle_complete_status_tbl vcst on vcst.vehicle_id=vmt.vehicle_id and vcst.is_active='Y'
where vmt.vehicle_id=20 and ivit.invester_id=2;

/*document details*/
select vehicle_id,manufacturing_year,chasis_no,engine_no,
insurance_expiry,insurance_image,rc_availability,rc_image,under_hypothecation
 from vehicle_document_details_tbl where vehicle_id=20;
 
/*images*/
select vehicle_id,front_view,rear_view,right_view,left_view,digital_meter,dashboard,front_right_tyre,front_left_tyre,back_right_tyre,
back_left_tyre,interior_front,interior_back
from vehicle_condition_images_tbl where vehicle_id=20;

/*pricing details*/
select vehicle_id,cust_expt_price,buying_price,refurbish_amount
 from evaluated_vehicle_pricing_details_tbl where vehicle_id=20;
 
 /*exterior+ interior*/
 select sdmt.sub_details,vcmt.condition_name, ifnull(vcdt.images,'-') as images
from vehicle_condition_details_tbl vcdt inner join sub_details_master_tbl sdmt on vcdt.sub_details_id=sdmt.sub_details_id
and sdmt.is_active='Y'
inner join vehicle_details_master_tbl vdmt on vdmt.details_id=sdmt.details_id
inner join vehicle_condition_status_master_tbl vcmt on vcmt.status_id=vcdt.status_id
where vehicle_id=20 and vdmt.details_id=1
group by sdmt.sub_details_id;
