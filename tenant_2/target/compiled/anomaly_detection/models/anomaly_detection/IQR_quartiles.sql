

select   ARRAY(SELECT x FROM UNNEST(output) AS x WITH OFFSET
  WHERE OFFSET BETWEEN 1 AND ARRAY_LENGTH(output) - 2) as output, 
  app_event, agg_tag
  from (
select APPROX_QUANTILES(event_count, 4) AS output, app_event
, agg_tag
from `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`train_data`
group by app_event, agg_tag
order by app_event, agg_tag )