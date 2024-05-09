ARG dbt_core_version=1.7.14
ARG model_dir="/tpm_models"

FROM --platform=${TARGETPLATFORM} ghcr.io/dbt-labs/dbt-core:${dbt_core_version} as base
ARG dbt_bigquery_version=1.7.8
ARG model_dir
ARG base_models=anomaly_detection
COPY ./${base_models} ${model_dir}/${base_models}
RUN cd ${model_dir} && python -m pip install dbt-bigquery==${dbt_bigquery_version}

FROM base as tenant
ARG model_dir
ARG tenant
ENV DBT_PROFILES_DIR="${model_dir}/${tenant}"
ENV DBT_PROJECT_DIR="${model_dir}/${tenant}"
RUN test -n "${tenant}" || (echo "tenant  not set as arg" && false)
COPY ./${tenant} ${model_dir}/${tenant}
RUN dbt deps
