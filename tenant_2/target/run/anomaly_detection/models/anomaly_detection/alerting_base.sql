
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`alerting_base`
    
    
    OPTIONS()
    as (
      
  
  WITH ml_detect_updated AS (
    SELECT app_event, 
      CONCAT(agg_tag, '_', prob_threshold, "threshold", '_', RTRIM(LTRIM(training_period, "derived_models_"), CONCAT('_', agg_tag))) AS control_config,
      time_stamps, event_count, is_anomaly, lower_bound, upper_bound, anomaly_probability
    FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`reset_forecasts`
  )
  SELECT time_stamps, all_forecasts.app_event AS app_event, control_table.control_config AS control_config, 
    anomalies, RMSD_prcnt, event_count, lower_bound, upper_bound, anomaly_probability, is_anomaly
  FROM ml_detect_updated AS all_forecasts 
  INNER JOIN `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`control_table` AS control_table 
    ON all_forecasts.app_event = control_table.app_event
      AND all_forecasts.control_config = control_table.control_config
  ORDER BY all_forecasts.app_event, time_stamps
    );
  