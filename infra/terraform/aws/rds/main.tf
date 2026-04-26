resource "aws_db_subnet_group" "this" {
  name       = "streamvault"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "subscription" {
  identifier              = "streamvault-subscription"
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = "db.r7g.xlarge"
  allocated_storage       = 200
  storage_encrypted       = true
  db_subnet_group_name    = aws_db_subnet_group.this.name
  multi_az                = true
  backup_retention_period = 14
  deletion_protection     = true
  skip_final_snapshot     = false
}

variable "vpc_id"     { type = string }
variable "subnet_ids" { type = list(string) }
