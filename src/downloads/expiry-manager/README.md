# expiry-manager

Service in the downloads domain of StreamVault.

Language: Go Â· Port: 50283

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/expiry-manager/](../../../helm/charts/expiry-manager/) â€” Helm chart
- [manifests/downloads/expiry-manager/](../../../manifests/downloads/expiry-manager/) â€” Raw K8s manifests
