delimiter $$
CREATE  FUNCTION CheckoutCalculation(
purchase_amount double)
RETURNS varchar(500) CHARSET latin1
BEGIN
declare package_amount_shown varchar(200);
declare tax double;
declare final_package_mount double;
declare discount_set varchar(100);

set package_amount_shown = purchase_amount;
set tax = (purchase_amount * 0.18);
set final_package_mount = (package_amount_shown + tax);
RETURN json_object('purchase_price',package_amount_shown,'GST',tax, 'Total_price',final_package_mount);

end;




