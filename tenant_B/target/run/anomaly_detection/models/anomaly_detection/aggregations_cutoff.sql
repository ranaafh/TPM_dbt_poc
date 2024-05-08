
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`aggregations_cutoff`
    
    
    OPTIONS()
    as (
      

select time_stamps, app_event, agg_tag, event_count
from(
select time_stamps, strt_time, main.app_event, main.agg_tag, event_count
from `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`aggregations` as main
inner join `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`cutoff_dates` as cutoff
on main.agg_tag = cutoff.agg_tag
and main.app_event = cutoff.app_event
order by main.app_event, main.agg_tag, time_stamps)
where time_stamps >= strt_time
    );
  