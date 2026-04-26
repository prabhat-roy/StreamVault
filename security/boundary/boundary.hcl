controller {
  name = "controller-1"
  database { url = "postgresql://boundary@postgres-boundary/streamvault" }
}
worker {
  name = "worker-streamvault-1"
  controllers = ["controller-1.boundary.streamvault.internal"]
}
kms "awskms" {
  purpose = "root"
  key_id  = "alias/streamvault-boundary"
}
