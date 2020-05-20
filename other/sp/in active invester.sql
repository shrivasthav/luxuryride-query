delimiter $$
CREATE PROCEDURE `InActiveInterestsScheduler`()
BEGIN
DECLARE done INT DEFAULT FALSE;
	DECLARE getInterestId int(12);
    declare getpenaltyPrice int(100);
	DECLARE cur1 CURSOR FOR select ivi.interest_id,((purchase_price+refurbish_amount)*(0.1/100)) as price
    from invester_vehicle_interest_tbl ivi inner join purchased_vehicle_details_tbl pvt
    on pvt.vehicle_id=ivi.vehicle_id and pvt.is_active='Y'
	where ivi.penalty_date < now();
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur1;
    read_loop: LOOP
      FETCH cur1 INTO getInterestId,getpenaltyPrice;
      IF done THEN
        LEAVE read_loop;
      END IF;      
	SET SQL_SAFE_UPDATES = 0;
      update invester_vehicle_interest_tbl set is_active='N',penalty_amount=getpenaltyPrice where interest_id=getInterestId and is_active = 'Y';
	END LOOP;
    CLOSE cur1;
END;


delimiter $$
CREATE  EVENT `InActiveInvesterInterestsEvent` ON 
SCHEDULE EVERY 1 MINUTE STARTS '2019-01-11 23:02:15' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  	CALL InActiveInterestsScheduler();
  END