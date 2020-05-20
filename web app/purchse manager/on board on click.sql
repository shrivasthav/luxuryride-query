select evdt.vehicle_id,evdt.buying_price,evdt.cust_expt_price,evdt.refurbish_amount,
pvdt.purchase_price,pvdt.selling_price,pvdt.refurbish_amount
from purchased_vehicle_details_tbl pvdt inner join evaluated_vehicle_pricing_details_tbl evdt on pvdt.vehicle_id=evdt.vehicle_id
 and pvdt.is_active='Y'
and evdt.is_active='Y'
where pvdt.vehicle_id=13;