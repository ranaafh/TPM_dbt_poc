
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`nonrecent_configs`
    
    
    OPTIONS()
    as (
      
SELECT features.app_event, control_config, anomalies, RMSD_prcnt
FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`nonrecent_events` AS non_recent
INNER JOIN `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`all_configs` AS features
  ON non_recent.app_event = features.app_event
    );
  