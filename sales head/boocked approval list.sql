select slmt.customer_id,slmt.customer_name,slmt.phone_no,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
concat(emt.first_name,' - ',st.showroom_code) as employee_name
 from customer_status_update_tbl csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id
and csut.is_active='Y'
inner join car_model_master_tbl cmt on cmt.car_id=csut.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=csut.car_model
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where csut.customer_status=3 and csut.followup_status=6 and csut.is_unbooked='Y'
group by slmt.customer_id;