# studio-dashboard

Service in the creator domain of StreamVault.

Language: Go Â· Port: 50201

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/studio-dashboard/](../../../helm/charts/studio-dashboard/) â€” Helm chart
- [manifests/creator/studio-dashboard/](../../../manifests/creator/studio-dashboard/) â€” Raw K8s manifests
