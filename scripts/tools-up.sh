#!/usr/bin/env bash
# One-shot deploy of every OSS tool registered for StreamVault via ArgoCD.
set -euo pipefail
argocd app sync -l "project=streamvault-tools" --grpc-web
