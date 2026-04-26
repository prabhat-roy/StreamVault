# Kubernetes auth method binding service accounts to Vault policies.
# Bind each domain-sensitive ServiceAccount to its narrow policy.

# vault write auth/kubernetes/role/drm-service \
#   bound_service_account_names=drm-service \
#   bound_service_account_namespaces=streamvault-drm,streamvault \
#   policies=drm-service ttl=15m

# vault write auth/kubernetes/role/licence-server \
#   bound_service_account_names=licence-server \
#   bound_service_account_namespaces=streamvault-drm \
#   policies=licence-server ttl=15m
