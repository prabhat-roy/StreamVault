# origin-service

Service in the **cdn** domain of StreamVault.

**Language:** Go · **Port:** 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/origin-service/](../../../helm/charts/origin-service/) — Helm chart
- [manifests/cdn/origin-service/](../../../manifests/cdn/origin-service/) — Raw K8s manifests
