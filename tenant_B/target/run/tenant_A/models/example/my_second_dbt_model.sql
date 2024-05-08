

  create or replace view `prj-s-telus-tpm-data-fcfc`.`tenant_A`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `prj-s-telus-tpm-data-fcfc`.`tenant_A`.`my_first_dbt_model`
where id = 1;

