# watchlist-service

Service in the **social** domain of StreamVault.

**Language:** Go · **Port:** 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/watchlist-service/](../../../helm/charts/watchlist-service/) — Helm chart
- [manifests/social/watchlist-service/](../../../manifests/social/watchlist-service/) — Raw K8s manifests
