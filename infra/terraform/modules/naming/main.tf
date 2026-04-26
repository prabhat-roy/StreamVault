variable "project" { type = string default = "streamvault" }
variable "env"     { type = string }
variable "cloud"   { type = string }
variable "domain"  { type = string }

output "name" { value = "${var.project}-${var.cloud}-${var.env}-${var.domain}" }
output "tags" {
  value = {
    project     = var.project
    environment = var.env
    cloud       = var.cloud
    domain      = var.domain
    managed_by  = "terraform"
  }
}
