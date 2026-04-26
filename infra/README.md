# Infra — StreamVault

IaC source — Terraform, OpenTofu, Crossplane, Ansible.

```
infra/terraform/
├── aws/        ← VPC, EKS w/ GPU node pool, RDS, ElastiCache, MSK, MediaConvert, S3 origin, CloudFront, KMS, Secrets Manager, Vault HSM
├── gcp/        ← VPC, GKE w/ T4 nodes, Cloud SQL, Memorystore, Pub/Sub, GCS origin, Cloud CDN, KMS, Secret Manager
├── azure/      ← VNet, AKS w/ GPU, Azure DB Postgres, Azure Cache, Event Hubs, Blob origin, Front Door, Key Vault HSM
└── modules/    ← Cross-cloud shared modules (naming, tagging, OIDC discovery, vault-hsm)
```

DRM master keys are provisioned in HSM (CloudHSM / Cloud HSM / Azure Dedicated HSM) and never leave the HSM boundary.
