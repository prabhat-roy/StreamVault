# churn-service

Service in the subscription domain of StreamVault.

Language: Go Â· Port: 50183

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/churn-service/](../../../helm/charts/churn-service/) â€” Helm chart
- [manifests/subscription/churn-service/](../../../manifests/subscription/churn-service/) â€” Raw K8s manifests
