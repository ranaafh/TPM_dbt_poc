
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`train_data`
    
    
    OPTIONS()
    as (
      

select *
from `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`aggregations_cutoff`
where DATE(time_stamps) < DATE_SUB("2023-02-09", INTERVAL 10 DAY)
    );
  