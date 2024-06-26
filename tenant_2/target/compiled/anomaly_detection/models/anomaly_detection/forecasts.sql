-- 3 periods of training * 2 probabality threshold * 4 aggregation levels



-- depends_on: `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`IQR_outliers`


  WITH test_set AS (
    SELECT
    time_stamps,
          event_count,
          app_event,
          agg_tag
        FROM
          `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`aggregations_cutoff`
        WHERE
        DATE(time_stamps) >= DATE_SUB("2023-02-09", INTERVAL 10 DAY)
  )

    

      

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_1mon_8hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_8hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "8hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_2mon_24hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_24hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "24hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_2mon_12hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_12hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "12hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_2mon_8hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_8hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "8hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_2mon_4hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_4hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "4hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_1mon_4hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_4hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "4hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_1mon_12hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_12hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "12hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_1mon_24hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_24hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "24hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_05mon_4hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_4hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "4hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_05mon_8hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_8hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "8hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_05mon_12hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_12hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "12hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.9999" AS prob_threshold,
          "derived_models_05mon_24hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_24hr`,
            struct( 0.9999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "24hr" ))
          )

        union all

      

    

      

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_1mon_8hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_8hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "8hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_2mon_24hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_24hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "24hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_2mon_12hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_12hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "12hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_2mon_8hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_8hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "8hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_2mon_4hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_2mon_4hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "4hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_1mon_4hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_4hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "4hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_1mon_12hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_12hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "12hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_1mon_24hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_1mon_24hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "24hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_05mon_4hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_4hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "4hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_05mon_8hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_8hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "8hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_05mon_12hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_12hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "12hr" ))
          )

        union all

      

        SELECT
          app_event, agg_tag,
          time_stamps,
          "0.999999" AS prob_threshold,
          "derived_models_05mon_24hr" AS training_period,
          event_count,
          is_anomaly,
          lower_bound,
          upper_bound,
          anomaly_probability
        FROM
          ml.detect_anomalies(
            model `prj-s-telus-tpm-data-fcfc`.`tenant_B`.`models_05mon_24hr`,
            struct( 0.999999 as anomaly_prob_threshold),
            (select * from (select * from test_set where agg_tag = "24hr" ))
          )

        

      

    