
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`raw_data`
    
    
    OPTIONS()
    as (
      
SELECT collector_tstamp, event_id, app_event
FROM `prj-s-telus-tpm-data-fcfc`.`dbt_rhashemi`.`sample_table_final`
WHERE DATE( collector_tstamp ) >= DATE_SUB("2023-02-09", INTERVAL 90 DAY) AND DATE( collector_tstamp ) < "2023-02-09"
    );
  