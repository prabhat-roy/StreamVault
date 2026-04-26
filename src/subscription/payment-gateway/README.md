# payment-gateway

Service in the **subscription** domain of StreamVault.

**Language:** Go · **Port:** 50181

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/payment-gateway/](../../../helm/charts/payment-gateway/) — Helm chart
- [manifests/subscription/payment-gateway/](../../../manifests/subscription/payment-gateway/) — Raw K8s manifests
