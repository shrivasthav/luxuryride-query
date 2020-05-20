select (SELECT 
 CASe WHEN 'F' NOT IN (SELECT interesred_in FROM customer_interested_plan_tbl WHERE is_active = 'Y' and customer_id=cipt.customer_id)
   THEN 'N' ELSE 'Y' END )'interested_F_plan',
 (SELECT 
 CASe WHEN 'N' NOT IN (SELECT interesred_in FROM customer_interested_plan_tbl WHERE is_active = 'Y' and customer_id=cipt.customer_id)
   THEN 'N' ELSE 'Y' END) 'interested_N_plan',
 (SELECT 
 CASe WHEN 'T' NOT IN (SELECT interesred_in FROM customer_interested_plan_tbl WHERE is_active = 'Y' and customer_id=cipt.customer_id)
   THEN 'N' ELSE 'Y' END) 'interested_T_plan'
  from customer_interested_plan_tbl cipt where cipt.customer_id=10
     group by cipt.customer_id
     union all select 'N','N','N' 