# collection-service

Service in the **catalogue** domain of StreamVault.

**Language:** Go · **Port:** 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/collection-service/](../../../helm/charts/collection-service/) — Helm chart
- [manifests/catalogue/collection-service/](../../../manifests/catalogue/collection-service/) — Raw K8s manifests
