select emt.employee_id,emt.first_name,emt.phone_number,emt.email_id,edt.date_of_birth,edt.gender,edt.Permanent_Address,cmt.city,
edt.Permanent_state,edt.Permanent_pincode,ert.role,edt.date_of_join,dt.document_name,document_proof,emt.created_on
 from employee_master_tbl emt 
 inner join city_master_tbl cmt on emt.employee_location=cmt.city_id and emt.is_active='Y' and cmt.is_active='Y'
 inner join employee_roles_tbl ert on ert.role_id=emt.role_id 
 inner join employee_details_tbl edt on edt.employee_id=emt.employee_id
 inner join state_master_tbl st on st.state_id=edt.Permanent_state
 inner join documents_tbl dt on dt.document_id=edt.document_id
 where emt.employee_id=2;