/*(my details)*/
select  imt.invester_name,imt.phone_number,imt.email_id,date(imt.registered_on) as registered_on,
case when imt.budget_id in (1,2,3) and idt.is_active='Y' then idt.remain_amount
     when  imt.budget_id=4 then 'UNLIMITED'
     else ibt.amount end as amount,
count(distinct ivit.vehicle_id) as No_of_cars_invested,ibt.budget
from invester_master_tbl imt left join invester_vehicle_interest_tbl ivit on imt.invester_id=ivit.invester_id
inner join invester_budget_master_tbl ibt on ibt.budget_id=imt.budget_id
left join invester_debit_amount_tbl idt on idt.invester_id=imt.invester_id and idt.is_active='Y'
and imt.is_active='Y'  where imt.invester_id=2 and ivit.is_active='Y';


/*(my car brands)*/
select cmt.car_id, cmt.car_make,
case when FIND_IN_SET(cmt.car_id, (SELECT car_id FROM invester_car_brand_tbl WHERE invester_id = 2)) then 'selected'
else 'not selected' end as model_status
from car_model_master_tbl cmt left join invester_car_brand_tbl icbt on  cmt.car_id=icbt.car_id and cmt.is_active='Y' and 
icbt.is_active='Y' 
group by cmt.car_id;





