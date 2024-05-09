
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`control_table`
    
    
    OPTIONS()
    as (
      

SELECT configs.app_event, configs.control_config, 
    configs.anomalies, configs.RMSD_prcnt
  FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`min_anomalies_configs` AS configs
  INNER JOIN `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`min_RMSD` AS min_RMSD
    ON configs.RMSD_prcnt = min_RMSD.RMSD_prcnt
      AND configs.app_event = min_RMSD.app_event
  ORDER BY configs.app_event, control_config
    );
  