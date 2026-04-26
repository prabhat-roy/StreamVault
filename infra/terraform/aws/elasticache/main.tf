resource "aws_elasticache_subnet_group" "this" {
  name       = "streamvault"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "session" {
  replication_group_id    = "streamvault-session"
  description             = "Session + recently-watched + rate limit"
  engine                  = "redis"
  engine_version          = "7.1"
  node_type               = "cache.r7g.large"
  num_cache_clusters      = 3
  automatic_failover_enabled = true
  subnet_group_name       = aws_elasticache_subnet_group.this.name
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
}

variable "vpc_id"     { type = string }
variable "subnet_ids" { type = list(string) }
