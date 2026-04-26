# playback-analytics

Service in the **analytics** domain of StreamVault.

**Language:** Go · **Port:** 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/playback-analytics/](../../../helm/charts/playback-analytics/) — Helm chart
- [manifests/analytics/playback-analytics/](../../../manifests/analytics/playback-analytics/) — Raw K8s manifests
