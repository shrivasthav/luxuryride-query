delimiter $$
CREATE TRIGGER after_sales_lead_insert
 before insert
 ON sales_lead_master_tbl FOR EACH ROW
 BEGIN
    case when  NEW.planning_by=1 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 15 DAY) ;
   when  NEW.planning_by=2 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 30 DAY) ;
      when   NEW.planning_by=3 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 60 DAY) ;
      when    NEW.planning_by=4 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 90 DAY) ;
 END case;
 END	;