# engagement-analytics

Service in the **analytics** domain of StreamVault.

**Language:** Go · **Port:** 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/engagement-analytics/](../../../helm/charts/engagement-analytics/) — Helm chart
- [manifests/analytics/engagement-analytics/](../../../manifests/analytics/engagement-analytics/) — Raw K8s manifests
