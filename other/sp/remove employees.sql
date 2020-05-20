CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveEmployees`(
in employees varchar(1000))
BEGIN

declare employee_id_set int;
declare role_id_set int;
declare dor date;
DECLARE done INT DEFAULT FALSE
declare userData CURSOR FOR SELECT emt.employee_id,erat.role_id FROM
												employee_master_tbl emt INNER JOIN employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
												and emt.is_active='Y' and erat.is_active='Y' and FIND_IN_SET(emt.employee_id,employees);

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
set SQL_SAFE_UPDATES = 0;
    OPEN userData;
	read_loop: LOOP
		FETCH userData INTO employee_id_set,role_id_set;
		set dor = (select date_add(date, interval 1 day)  from employee_attendance_tbl where employee_id = employee_id_set order by date desc limit 1);
		IF done THEN
			LEAVE read_loop;
		END IF;
        case 
        when role_id_set = 1 then
            update employee_vehicle_assignment_tbl set is_active = 'N' where employee_id = employee_id_set and is_active='Y';
            update employee_assignment_tbl set is_active = 'N' where employee_id = employee_id_set and is_active='Y';
            update employee_master_tbl set is_active = 'N', date_of_releaving = dor where employee_id = employee_id_set and is_active='Y';
	
        when role_id_set = 2 then
            update employee_apartment_assignment_tbl set is_active='N' where supervisor_id = employee_id_set and is_active='Y';
			update employee_vehicle_assignment_tbl set is_active = 'N' where is_active='Y' and employee_id in (select employee_id from employee_assignment_tbl where  assigned_to=employee_id_set and is_active='Y')
            update employee_assignment_tbl set is_active = 'N' where employee_id = employee_id_set and is_active='Y';
            update employee_assignment_tbl set is_active = 'N' where assigned_to = employee_id_set and is_active='Y';
			update employee_master_tbl set is_active = 'N', date_of_releaving = dor where employee_id = employee_id_set and is_active='Y';
        end case;
	END LOOP;
    CLOSE userData;
set SQL_SAFE_UPDATES = 1;
END