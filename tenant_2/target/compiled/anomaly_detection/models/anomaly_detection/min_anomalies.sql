

SELECT app_event, MIN(anomalies) AS anomalies 
  FROM `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`filtered_nonrecent_configs`
  GROUP BY app_event
  ORDER BY app_event