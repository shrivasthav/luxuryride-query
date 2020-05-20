select pvdt.vehicle_id,pvdt.purchase_price,pvdt.selling_price,pvdt.refurbish_amount,
(pvdt.purchase_price+pvdt.refurbish_amount) as total_investment_amount,
(pvdt.selling_price-(pvdt.purchase_price+pvdt.refurbish_amount)) as net_profit,
((pvdt.selling_price-(pvdt.purchase_price+pvdt.refurbish_amount))*0.41) as invester_share
 from invester_vehicle_interest_tbl ivit inner join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=ivit.vehicle_id
and ivit.is_active='Y' and pvdt.is_active='Y'
inner join invester_master_tbl imt on imt.invester_id=ivit.invester_id 
where pvdt.vehicle_id=20;
