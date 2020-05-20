CREATE TRIGGER after_investor_interst_insert
  before insert
  ON invester_vehicle_interest_tbl FOR EACH ROW
  BEGIN
  SET NEW.penalty_date = DATE_ADD(now(), INTERVAL 2 DAY) ;
  END ;