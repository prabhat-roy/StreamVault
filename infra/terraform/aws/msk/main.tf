resource "aws_msk_cluster" "this" {
  cluster_name           = "streamvault"
  kafka_version          = "3.7.x"
  number_of_broker_nodes = 6

  broker_node_group_info {
    instance_type   = "kafka.m7g.xlarge"
    client_subnets  = var.subnet_ids
    storage_info { ebs_storage_info { volume_size = 1000 } }
  }

  encryption_info {
    encryption_in_transit { client_broker = "TLS", in_cluster = true }
  }

  open_monitoring {
    prometheus { jmx_exporter { enabled_in_broker = true } }
  }
}

variable "vpc_id"     { type = string }
variable "subnet_ids" { type = list(string) }
