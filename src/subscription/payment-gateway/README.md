# payment-gateway

Service in the subscription domain of StreamVault.

Language: Go Â· Port: 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/payment-gateway/](../../../helm/charts/payment-gateway/) â€” Helm chart
- [manifests/subscription/payment-gateway/](../../../manifests/subscription/payment-gateway/) â€” Raw K8s manifests
