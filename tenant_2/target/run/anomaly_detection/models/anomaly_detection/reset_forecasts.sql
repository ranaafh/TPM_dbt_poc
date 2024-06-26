
  
    

    create or replace table `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`reset_forecasts`
    
    
    OPTIONS()
    as (
      
  
  with neg_bound_reset as (
SELECT app_event, agg_tag, time_stamps, prob_threshold, training_period, event_count, 
  IF (lower_bound < 0, 2, (1 / 1.3) * lower_bound) AS lower_bound, 1.3 * upper_bound AS upper_bound, anomaly_probability, is_anomaly
FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`forecasts` )

SELECT app_event, agg_tag, time_stamps, prob_threshold, training_period, event_count, 
  lower_bound, upper_bound, anomaly_probability,
  (upper_bound < event_count OR event_count < lower_bound) AS is_anomaly
FROM neg_bound_reset
    );
  