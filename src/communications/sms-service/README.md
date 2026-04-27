# sms-service

Service in the communications domain of StreamVault.

Language: Go Â· Port: 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sms-service/](../../../helm/charts/sms-service/) â€” Helm chart
- [manifests/communications/sms-service/](../../../manifests/communications/sms-service/) â€” Raw K8s manifests
