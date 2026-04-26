# live-ingest

Service in the **live** domain of StreamVault.

**Language:** Go · **Port:** 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/live-ingest/](../../../helm/charts/live-ingest/) — Helm chart
- [manifests/live/live-ingest/](../../../manifests/live/live-ingest/) — Raw K8s manifests
