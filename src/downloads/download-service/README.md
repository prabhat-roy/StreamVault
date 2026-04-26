# download-service

Service in the **downloads** domain of StreamVault.

**Language:** Go · **Port:** 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/download-service/](../../../helm/charts/download-service/) — Helm chart
- [manifests/downloads/download-service/](../../../manifests/downloads/download-service/) — Raw K8s manifests
