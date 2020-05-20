/* no_of_investers count*/
select count(distinct invester_id) as no_of_investers from invester_master_tbl where is_active='Y';

/* packages */
select ibmt.budget_id,ibmt.budget,count(distinct imt.invester_id) as no_of_investers
 from invester_master_tbl imt inner join invester_budget_master_tbl ibmt on ibmt.budget_id=imt.budget_id  
where imt.is_active='Y' and ibmt.is_active='Y'
group by ibmt.budget_id;

/* amount */
select (select ifnull(sum(invesed_amount),0) as invesed_amount from invester_debit_amount_tbl) as invesed_amount,
(select 0 as revenue) as revenue ,
(select 0 as returns) as returns ;

/* on click investment */
select imt.invester_name,imt.phone_number,count(distinct idat.vehicle_id) as car_count,sum(idat.invesed_amount) as invested_amount
from invester_debit_amount_tbl idat inner join invester_master_tbl imt on idat.invester_id=imt.invester_id and imt.is_active='Y'
group by idat.invester_id;


/* on click investor*/
select vmt.vehicle_id,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,vmt.registration_year,idat.invesed_amount
from invester_debit_amount_tbl idat inner join vehicle_master_tbl vmt on vmt.vehicle_id=idat.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where idat.invester_id=2
group by vmt.vehicle_id;


/* investor package on click*/
select invester_id,invester_name,phone_number
from invester_master_tbl  
where is_active='Y' and budget_id=4 
group by invester_id