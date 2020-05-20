/* carcount*/
select count(distinct id) as 'carcount' from expecting_cars_tbl where customer_id=1 and is_active='Y';



/* car details */
select 
ect.customer_id, cmt.car_make,vfdt.car_model,ect.manf_year,bmt.budget
 from expecting_cars_tbl ect inner join car_model_master_tbl cmt on ect.make=cmt.car_id and ect.is_active='Y'
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=ect.model_id 
inner join budget_master_tbl bmt on bmt.budget_id=ect.budget
where ect.customer_id=1;

