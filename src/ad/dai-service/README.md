# dai-service

Service in the **ad** domain of StreamVault.

**Language:** Go · **Port:** 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dai-service/](../../../helm/charts/dai-service/) — Helm chart
- [manifests/ad/dai-service/](../../../manifests/ad/dai-service/) — Raw K8s manifests
