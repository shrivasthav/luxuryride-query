select imt.invester_id, imt.invester_name,imt.phone_number,imt.email_id,imt.alternate_phone_number,imt.address_line1,cmt.city,st.state,imt.pincode,
ibt.budget,imt.invester_share,
imt.document_file_name,imt.agreement_file_name
from invester_master_tbl imt  
inner join city_master_tbl cmt on cmt.city_id=imt.location  and imt.is_active='Y'
inner join state_master_tbl st on st.state_id=imt.state
inner join invester_budget_master_tbl ibt on ibt.budget_id=imt.budget_id
where imt.invester_id=2
group by imt.invester_id;

/* car brands*/
select ibt.invester_id,cmt.car_id,cmt.car_make
from invester_car_brand_tbl ibt inner join car_model_master_tbl cmt on ibt.car_id=cmt.car_id and ibt.is_active='Y'
where ibt.invester_id=2
group by ibt.car_id;

/* car brands*/
select cmt.car_id,cmt.car_make
from car_model_master_tbl cmt 
where cmt.car_id in(select 
case when FIND_IN_SET(cmt.car_id, (SELECT car_id FROM invester_car_brand_tbl WHERE invester_id = 2)) then 
cmt.car_id end as vehicle_name
from car_model_master_tbl cmt where cmt.is_active='Y')
