# Terraform — StreamVault Multi-Cloud Infrastructure

Each cloud has a **complete, standalone** deployment path. A team can pick **AWS,
GCP, or Azure** and bring up the entire StreamVault platform on it without depending
on the other clouds.

## Cloud-equivalent services

| Capability        | AWS                    | GCP                       | Azure                          |
|-------------------|------------------------|---------------------------|--------------------------------|
| Kubernetes (GPU)  | EKS + g5 nodepool      | GKE + T4 nodepool         | AKS + NCv3 nodepool            |
| PostgreSQL        | RDS for Postgres       | Cloud SQL for Postgres    | Azure Database for PostgreSQL  |
| Cache (Redis)     | ElastiCache for Redis  | Memorystore for Redis     | Azure Cache for Redis          |
| Cassandra         | Keyspaces              | Cassandra on GCE          | Cosmos DB Cassandra API        |
| ClickHouse        | EC2 ASG + EBS          | GCE MIG + PD              | VMSS + Premium SSD             |
| Kafka             | MSK                    | Confluent / self-managed  | Event Hubs (Kafka surface)     |
| NATS JetStream    | EKS deployed           | GKE deployed              | AKS deployed                   |
| Object storage    | S3 (origin)            | GCS (origin)              | Blob (origin)                  |
| CDN               | CloudFront             | Cloud CDN                 | Front Door                     |
| Transcoding       | MediaConvert + Spot    | Transcoder API + spot     | Media Services + Spot          |
| Live ingest       | MediaLive              | Live Stream API           | Media Services Live            |
| DRM HSM           | CloudHSM               | Cloud HSM                 | Azure Dedicated HSM            |
| Secrets           | Secrets Manager + KMS  | Secret Manager + KMS      | Key Vault                      |
| Identity          | IRSA via OIDC          | Workload Identity         | Pod Identity (Azure AD)        |

## Apply

```bash
cd infra/terraform/aws   && terraform init && terraform apply -var-file=prod.tfvars
cd infra/terraform/gcp   && terraform init && terraform apply -var-file=prod.tfvars
cd infra/terraform/azure && terraform init && terraform apply -var-file=prod.tfvars
```
