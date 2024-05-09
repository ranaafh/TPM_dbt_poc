## Prerequisite
```sh
export tenant=tenant_a
```

## Build
```sh
docker build \
  --platform=linux/amd64 \
  --build-arg="tenant=${tenant}" \
  -t dbt-${tenant} .
```

## Run
```sh
docker run dbt-${tenant} ls
```