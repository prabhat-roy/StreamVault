# rating-service

Service in the **social** domain of StreamVault.

**Language:** Go · **Port:** 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rating-service/](../../../helm/charts/rating-service/) — Helm chart
- [manifests/social/rating-service/](../../../manifests/social/rating-service/) — Raw K8s manifests
