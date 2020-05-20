select plt.lead_name,UCASE(CONCAT(cmt.car_make, '-', vfdt.car_model)) AS 'carModel',UCASE(plt.registration_no) 'registrationNo'
from vehicle_master_tbl vmt 
inner join car_model_master_tbl cmt ON cmt.car_id = vmt.car_make 
        INNER JOIN
    vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model 
    inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id 
    where vmt.vehicle_id=20;
    
/* document details*/
select vehicle_id,manufacturing_year,chasis_no,engine_no,insurance_expiry,insurance_image,rc_availability,rc_image,under_hypothecation
from vehicle_document_details_tbl where is_active='Y' and vehicle_id=20;

/* about vehicle*/
select details_id,details from vehicle_details_master_tbl where is_active='Y';

select  sdmt.sub_details,vct.condition_name,ifnull(vcdt.images,'-') as images
from vehicle_condition_details_tbl vcdt inner join sub_details_master_tbl sdmt on vcdt.sub_details_id=sdmt.sub_details_id and sdmt.is_active='Y'
and vcdt.is_active='Y'
inner join vehicle_details_master_tbl vdmt on vdmt.details_id=sdmt.details_id
inner join vehicle_condition_status_master_tbl vct on vct.status_id=vcdt.status_id 
where vdmt.details_id=5
and vcdt.vehicle_id=20
group by vcdt.sub_details_id;


/*vehicle images */
select vehicle_id, front_view,rear_view,right_view,left_view,digital_meter,dashboard,front_right_tyre,front_left_tyre,back_right_tyre,back_left_tyre,
interior_front,interior_back,comments
from vehicle_condition_images_tbl where is_active='Y' and vehicle_id=20;

/* pricing details*/
select vehicle_id,cust_expt_price,refurbish_amount,buying_price,comments
from evaluated_vehicle_pricing_details_tbl where is_active='Y' and vehicle_id=20;

/*final pricing*/
select purchase_price,refurbish_amount,selling_price,ifnull(comments,'NA') as comments
from purchased_vehicle_details_tbl where is_active='Y' and vehicle_id=20;

    