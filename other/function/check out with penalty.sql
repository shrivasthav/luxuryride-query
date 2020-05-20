delimiter $$
CREATE  FUNCTION CheckoutCalculationNew(
purchase_amount_set double(10,2),
invester_id int(15),
date_set datetime 
)
RETURNS varchar(500) CHARSET latin1
BEGIN
declare invester_ids varchar(200);
declare penalty_amount_set varchar(200);
declare package_amount_shown varchar(200);
declare penalty_amount varchar(200);
declare tax double;
declare final_package_mount double;
declare finalAmount varchar(200);

set penalty_amount_set=0;
set penalty_amount_set = ( select IFNULL(SUM(IF(iit.is_active='N' and iit.penalty_paid='N' , iit.penalty_amount, 0)),0) 
 from invester_vehicle_interest_tbl iit where iit.penalty_date<=date_set and  iit.invester_id=invester_id);

case
when penalty_amount_set >=0 then 
set penalty_amount =penalty_amount_set;
set package_amount_shown = purchase_amount_set;
set tax = (package_amount_shown * 0.18);
set final_package_mount = (package_amount_shown + tax + penalty_amount);

RETURN json_object('purchase_price',package_amount_shown,'GST',tax,'penalty',penalty_amount,'Total_price',final_package_mount);
 
end case;
end;




