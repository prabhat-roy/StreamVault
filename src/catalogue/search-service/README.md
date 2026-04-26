# search-service

Service in the **catalogue** domain of StreamVault.

**Language:** Go · **Port:** 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/search-service/](../../../helm/charts/search-service/) — Helm chart
- [manifests/catalogue/search-service/](../../../manifests/catalogue/search-service/) — Raw K8s manifests
