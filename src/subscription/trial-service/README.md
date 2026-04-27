# trial-service

Service in the subscription domain of StreamVault.

Language: Go Â· Port: 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/trial-service/](../../../helm/charts/trial-service/) â€” Helm chart
- [manifests/subscription/trial-service/](../../../manifests/subscription/trial-service/) â€” Raw K8s manifests
