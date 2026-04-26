# analytics-creator

Service in the **creator** domain of StreamVault.

**Language:** Go · **Port:** 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/analytics-creator/](../../../helm/charts/analytics-creator/) — Helm chart
- [manifests/creator/analytics-creator/](../../../manifests/creator/analytics-creator/) — Raw K8s manifests
