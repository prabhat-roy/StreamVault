# playback-analytics

Service in the analytics domain of StreamVault.

Language: Go Â· Port: 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/playback-analytics/](../../../helm/charts/playback-analytics/) â€” Helm chart
- [manifests/analytics/playback-analytics/](../../../manifests/analytics/playback-analytics/) â€” Raw K8s manifests
