# notification-orchestrator

Service in the communications domain of StreamVault.

Language: Go Â· Port: 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/notification-orchestrator/](../../../helm/charts/notification-orchestrator/) â€” Helm chart
- [manifests/communications/notification-orchestrator/](../../../manifests/communications/notification-orchestrator/) â€” Raw K8s manifests
