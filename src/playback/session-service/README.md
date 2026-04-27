# session-service

Service in the playback domain of StreamVault.

Language: Go Â· Port: 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/session-service/](../../../helm/charts/session-service/) â€” Helm chart
- [manifests/playback/session-service/](../../../manifests/playback/session-service/) â€” Raw K8s manifests
