
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`filtered_nonrecent_configs`
    
    
    OPTIONS()
    as (
      

select *
from `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`nonrecent_configs`
where RMSD_prcnt is not null
    );
  