# trending-service

Service in the **personalisation** domain of StreamVault.

**Language:** Go · **Port:** 50242

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/trending-service/](../../../helm/charts/trending-service/) — Helm chart
- [manifests/personalisation/trending-service/](../../../manifests/personalisation/trending-service/) — Raw K8s manifests
