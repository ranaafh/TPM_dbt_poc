
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`min_RMSD`
    
    
    OPTIONS()
    as (
      

SELECT app_event, MIN(RMSD_prcnt) AS RMSD_prcnt 
  FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`min_anomalies_configs`
  GROUP BY app_event
  ORDER BY app_event
    );
  