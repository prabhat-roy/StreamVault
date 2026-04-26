# qoe-service

Service in the **analytics** domain of StreamVault.

**Language:** Go · **Port:** 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/qoe-service/](../../../helm/charts/qoe-service/) — Helm chart
- [manifests/analytics/qoe-service/](../../../manifests/analytics/qoe-service/) — Raw K8s manifests
