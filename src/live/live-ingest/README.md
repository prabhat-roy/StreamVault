# live-ingest

Service in the live domain of StreamVault.

Language: Go Â· Port: 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/live-ingest/](../../../helm/charts/live-ingest/) â€” Helm chart
- [manifests/live/live-ingest/](../../../manifests/live/live-ingest/) â€” Raw K8s manifests
