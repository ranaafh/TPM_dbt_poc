
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`cutoff_dates`
    
    
    OPTIONS()
    as (
      

select agg_tag, app_event, min(time_stamps) as strt_time
from `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`aggregations`
where event_count > 50
group by app_event, agg_tag 
order by app_event, agg_tag
    );
  