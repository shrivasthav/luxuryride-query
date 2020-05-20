delimiter $$
CREATE procedure getInvesterFilterPrice(in getmin int , in getmax int)
begin
 
 
if getmin is null and getmax is null then 
select vehicle_id from purchased_vehicle_details_tbl where is_active='Y';
else 
select vehicle_id  from purchased_vehicle_details_tbl 
where (purchase_price+refurbish_amount) between
getmin and getmax group by vehicle_id;
end if;
end