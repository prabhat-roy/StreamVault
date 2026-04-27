# cdn-orchestrator

Service in the cdn domain of StreamVault.

Language: Go Â· Port: 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cdn-orchestrator/](../../../helm/charts/cdn-orchestrator/) â€” Helm chart
- [manifests/cdn/cdn-orchestrator/](../../../manifests/cdn/cdn-orchestrator/) â€” Raw K8s manifests
