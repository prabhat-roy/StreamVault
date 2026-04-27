# playback-orchestrator

Service in the playback domain of StreamVault.

Language: Go Â· Port: 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/playback-orchestrator/](../../../helm/charts/playback-orchestrator/) â€” Helm chart
- [manifests/playback/playback-orchestrator/](../../../manifests/playback/playback-orchestrator/) â€” Raw K8s manifests
