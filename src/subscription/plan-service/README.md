# plan-service

Service in the **subscription** domain of StreamVault.

**Language:** Go · **Port:** 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/plan-service/](../../../helm/charts/plan-service/) — Helm chart
- [manifests/subscription/plan-service/](../../../manifests/subscription/plan-service/) — Raw K8s manifests
