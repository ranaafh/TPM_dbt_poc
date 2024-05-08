
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`daily_alerts`
    
    
    OPTIONS()
    as (
      
SELECT time_stamps, app_event, event_count AS event_count_anomalous_yesterday
FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`alerting_base`
WHERE DATE(time_stamps) = "2023-02-09" - 1 
  AND is_anomaly
    );
  