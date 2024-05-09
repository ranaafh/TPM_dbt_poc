
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`nonrecent_events`
    
    
    OPTIONS()
    as (
      

SELECT MIN(time_stamps) AS strt_time, app_event
FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`aggregations_cutoff`
GROUP BY app_event
HAVING DATE(MIN(time_stamps)) < DATE_SUB("2023-02-09", INTERVAL 30 DAY)
ORDER BY strt_time
    );
  