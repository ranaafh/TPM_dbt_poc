
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`min_anomalies_configs`
    
    
    OPTIONS()
    as (
      

SELECT configs.app_event, configs.control_config, 
    configs.anomalies, configs.RMSD_prcnt
  FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`filtered_nonrecent_configs` AS configs
  INNER JOIN `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`min_anomalies` AS min_anomalies
    ON configs.anomalies = min_anomalies.anomalies
      AND configs.app_event = min_anomalies.app_event
  ORDER BY configs.app_event, RMSD_prcnt DESC
    );
  