/* sales manager on click*/
select emt.employee_id, emt.first_name,emt.phone_number
 from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and esat.is_active='Y' and emt.is_active='Y' and emt.role_id=5
inner join showrooms_tbl  st on st.showroom_id=esat.showroom_id
where find_in_set(st.showroom_id,getshowrmid(null)) 
group by emt.employee_id;

/* converted leads on click */
select slmt.customer_id, slmt.customer_name,slmt.phone_no,concat(cmt.car_make,' - ',vfdt.car_model)  as vehicle_name
from vehicle_sales_details_tbl vsdt inner join sales_lead_master_tbl slmt on slmt.customer_id=vsdt.customer_id and
vsdt.is_active='Y' 
inner join vehicle_master_tbl vmt on vmt.vehicle_id=vsdt.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by and esat.is_active='Y'
where find_in_set(esat.showroom_id,getshowrmid(null))
group by vsdt.vehicle_id;

/*total inventory on click */
select svat.vehicle_id,cmt.car_make,vfdt.car_model,vmt.manufactured_year,svat.final_selling_price,pvdt.purchase_price,
svat.vehicle_images
 from showroom_vehicle_assignment_tbl svat inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id
and svat.is_active='Y'
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
left join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=svat.vehicle_id 
where svat.vehicle_id not in (select vehicle_id from vehicle_sales_details_tbl where is_active='Y')
and find_in_set(svat.showroom_id,getshowrmid(null))
group by svat.vehicle_id;

/* on click pending approval*/
select emt.employee_id,emt.first_name, count(distinct csut.customer_id) as pending_count
from sales_lead_master_tbl slmt inner join customer_status_update_tbl csut on slmt.customer_id=csut.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by and esat.is_active='Y'
where csut.customer_status in (5,6)
and find_in_set(esat.showroom_id,getshowrmid(null))
group by emt.employee_id;




