select imt.invester_name,imt.phone_number,imt.email_id,imt.is_default_passowrd,imt.invester_share,cmt.city,ibmt.budget,imt.registered_on
 from invester_master_tbl imt inner join city_master_tbl cmt on cmt.city_id=imt.location 
and imt.is_active='Y'
inner join invester_budget_master_tbl ibmt on ibmt.budget_id=imt.budget_id
where imt.invester_id=2