# stream-packager

Service in the **live** domain of StreamVault.

**Language:** Go · **Port:** 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/stream-packager/](../../../helm/charts/stream-packager/) — Helm chart
- [manifests/live/stream-packager/](../../../manifests/live/stream-packager/) — Raw K8s manifests
