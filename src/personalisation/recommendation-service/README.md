# recommendation-service

Service in the **personalisation** domain of StreamVault.

**Language:** Go · **Port:** 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/recommendation-service/](../../../helm/charts/recommendation-service/) — Helm chart
- [manifests/personalisation/recommendation-service/](../../../manifests/personalisation/recommendation-service/) — Raw K8s manifests
