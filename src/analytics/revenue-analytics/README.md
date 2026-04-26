# revenue-analytics

Service in the **analytics** domain of StreamVault.

**Language:** Go · **Port:** 50303

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/revenue-analytics/](../../../helm/charts/revenue-analytics/) — Helm chart
- [manifests/analytics/revenue-analytics/](../../../manifests/analytics/revenue-analytics/) — Raw K8s manifests
