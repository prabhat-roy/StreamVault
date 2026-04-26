# abr-service

Service in the **cdn** domain of StreamVault.

**Language:** Go · **Port:** 50104

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/abr-service/](../../../helm/charts/abr-service/) — Helm chart
- [manifests/cdn/abr-service/](../../../manifests/cdn/abr-service/) — Raw K8s manifests
