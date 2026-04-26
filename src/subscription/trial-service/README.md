# trial-service

Service in the **subscription** domain of StreamVault.

**Language:** Go · **Port:** 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/trial-service/](../../../helm/charts/trial-service/) — Helm chart
- [manifests/subscription/trial-service/](../../../manifests/subscription/trial-service/) — Raw K8s manifests
