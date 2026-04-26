# ad-analytics

Service in the **ad** domain of StreamVault.

**Language:** Go · **Port:** 50223

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ad-analytics/](../../../helm/charts/ad-analytics/) — Helm chart
- [manifests/ad/ad-analytics/](../../../manifests/ad/ad-analytics/) — Raw K8s manifests
