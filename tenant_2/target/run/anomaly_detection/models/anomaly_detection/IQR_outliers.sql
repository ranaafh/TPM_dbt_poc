
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`IQR_outliers`
    
    
    OPTIONS()
    as (
      

with bounds_agg as (
select time_stamps, bounds.app_event as app_event, bounds.agg_tag as agg_tag, event_count, LB, UB
from `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`IQR_bounds` as bounds
inner join `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`train_data` as aggs
on bounds.app_event = aggs.app_event
and bounds.agg_tag = aggs.agg_tag
order by bounds.app_event, bounds.agg_tag)

select time_stamps, app_event, agg_tag,
case when event_count > UB then UB
when event_count < LB then LB
else event_count
end as event_count
from bounds_agg
order by app_event, agg_tag, time_stamps
    );
  