# sync-service

Service in the **downloads** domain of StreamVault.

**Language:** Go · **Port:** 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sync-service/](../../../helm/charts/sync-service/) — Helm chart
- [manifests/downloads/sync-service/](../../../manifests/downloads/sync-service/) — Raw K8s manifests
