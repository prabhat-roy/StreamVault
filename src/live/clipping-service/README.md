# clipping-service

Service in the **live** domain of StreamVault.

**Language:** Go · **Port:** 50124

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clipping-service/](../../../helm/charts/clipping-service/) — Helm chart
- [manifests/live/clipping-service/](../../../manifests/live/clipping-service/) — Raw K8s manifests
