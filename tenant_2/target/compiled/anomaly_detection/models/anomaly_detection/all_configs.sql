
  
  SELECT
    app_event,
    CONCAT(agg_tag, '_', prob_threshold, "threshold", '_', RTRIM(LTRIM(training_period, "derived_models_"), CONCAT('_', agg_tag))) AS control_config,
    SUM(CASE WHEN is_anomaly = TRUE THEN 1 ELSE 0 END) AS anomalies,
    SQRT(AVG( POWER(upper_bound - lower_bound, 2) ) ) / AVG(lower_bound) AS RMSD_prcnt
  FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`reset_forecasts` AS all_configs
  GROUP BY
    app_event,
    control_config
  ORDER BY
    control_config,
    app_event