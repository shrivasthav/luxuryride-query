select imt.invester_id,imt.invester_name,imt.phone_number,cmt.city,cmt.city,count(distinct ivt.vehicle_id) as no_of_cars_invested,
sum(ipdt.invesed_amount) as total_investment
 from invester_master_tbl imt 
 inner join city_master_tbl cmt on cmt.city_id=imt.location and cmt.is_active='Y'
 left join invester_vehicle_interest_tbl ivt on ivt.invester_id=imt.invester_id and ivt.is_active='Y'
 left join invester_debit_amount_tbl ipdt on ipdt.invester_id=imt.invester_id 
 where imt.is_active='Y'
 group by imt.invester_id;