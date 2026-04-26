# upload-service

Service in the **creator** domain of StreamVault.

**Language:** Go · **Port:** 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/upload-service/](../../../helm/charts/upload-service/) — Helm chart
- [manifests/creator/upload-service/](../../../manifests/creator/upload-service/) — Raw K8s manifests
