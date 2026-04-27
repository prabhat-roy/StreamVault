# recommendation-service

Service in the personalisation domain of StreamVault.

Language: Go Â· Port: 50240

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/recommendation-service/](../../../helm/charts/recommendation-service/) â€” Helm chart
- [manifests/personalisation/recommendation-service/](../../../manifests/personalisation/recommendation-service/) â€” Raw K8s manifests
