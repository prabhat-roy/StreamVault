variable "region" { type = string  default = "us-east-1" }
variable "env"    { type = string  default = "prod" }
variable "cluster_name" { type = string default = "streamvault-prod" }

variable "gpu_node_instance_types" {
  type    = list(string)
  default = ["g5.2xlarge", "g5.4xlarge"]
}

variable "spot_max_size" { type = number default = 200 }
