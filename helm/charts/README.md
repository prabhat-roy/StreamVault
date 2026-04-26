# Helm Charts — StreamVault

One chart per service. Charts are **cloud-agnostic** — Kubernetes primitives only.
Per-cloud differences live in `values-aws.yaml`, `values-gcp.yaml`, `values-azure.yaml`
which add cloud-specific annotations (IRSA / Workload Identity / Pod Identity),
storage classes, and ingress class names.

## Layout

```
helm/charts/<service>/
├── Chart.yaml
├── values.yaml            ← cloud-agnostic defaults
├── values-aws.yaml        ← IRSA + EBS + ALB + AWS Secrets CSI + S3 origin
├── values-gcp.yaml        ← Workload Identity + pd-balanced + GCE Ingress + Secret Manager CSI + GCS
├── values-azure.yaml      ← Pod Identity + managed-csi + AGIC + Key Vault CSI + Blob
└── templates/
    ├── _helpers.tpl
    ├── deployment.yaml
    ├── service.yaml
    └── serviceaccount.yaml
```

## Streaming-specific notes

- **Manifest endpoints** (HLS/DASH) get aggressive `Cache-Control` annotations on Service.
- **DRM licence-server** chart pulls keys from Vault HSM via the Secrets CSI driver — never from a ConfigMap or app DB.
- **Live packager + low-latency** charts are blue-green by default; rolling updates would interrupt active streams.
- **Transcoding** chart targets GPU node-pools (`nvidia.com/gpu`) on AWS / GCP, and Spot/Preemptible by default.
- **Edge-cache** chart is sized for very high cache-hit ratios (95%+); resource limits are intentionally generous.

## Install

```bash
SVC=playback-orchestrator
CLOUD=aws       # or gcp, azure
helm upgrade --install $SVC helm/charts/$SVC \
  --namespace streamvault \
  --create-namespace \
  -f helm/charts/$SVC/values.yaml \
  -f helm/charts/$SVC/values-$CLOUD.yaml
```
