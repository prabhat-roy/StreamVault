# churn-service

Service in the **subscription** domain of StreamVault.

**Language:** Go · **Port:** 50183

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/churn-service/](../../../helm/charts/churn-service/) — Helm chart
- [manifests/subscription/churn-service/](../../../manifests/subscription/churn-service/) — Raw K8s manifests
