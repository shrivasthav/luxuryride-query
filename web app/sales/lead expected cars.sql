select ect.customer_id,cmt.car_make,vfdt.car_model,bmt.budget,date(ect.added_on) as enquired_on
 from expecting_cars_tbl ect inner join car_model_master_tbl cmt on cmt.car_id=ect.make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=ect.model_id 
inner join budget_master_tbl bmt on bmt.budget_id=ect.budget
where ect.customer_id=1
group by ect.make,ect.model_id