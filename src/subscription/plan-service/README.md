# plan-service

Service in the subscription domain of StreamVault.

Language: Go Â· Port: 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/plan-service/](../../../helm/charts/plan-service/) â€” Helm chart
- [manifests/subscription/plan-service/](../../../manifests/subscription/plan-service/) â€” Raw K8s manifests
