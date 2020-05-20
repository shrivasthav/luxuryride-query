delimiter $$
CREATE TRIGGER service_jobcard_no_add
 before insert
 ON service_jobcard_master_tbl FOR EACH ROW
 BEGIN
  DECLARE last_id integer;
  SET last_id = (SELECT MAX(jobcard_id) AS lastID FROM service_jobcard_master_tbl);
     IF last_id IS NULL THEN
        SET last_id = 0;
    END IF;
      SET 
            new.job_card_no = concat('LRI - J',lpad((last_id+1),6,0));
 END	;