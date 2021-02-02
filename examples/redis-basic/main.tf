provider "aws" {
  region = "eu-west-1"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

#####
# VPC and subnets
#####
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}
#####
# Elasticache Redis
#####
module "redis" {
  source = "../../"

  name_prefix           = "redis-basic-example"
  number_cache_clusters = 2
  node_type             = "cache.t3.small"

  engine_version            = "6.x"
  port                      = 6379
  maintenance_window        = "mon:03:00-mon:04:00"
  snapshot_window           = "04:00-06:00"
  snapshot_retention_limit  = 7
  final_snapshot_identifier = "redis-final-snapshot-name"

  automatic_failover_enabled = true
  multi_az_enabled           = true

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = "1234567890asdfghjkl"

  apply_immediately = true
  family            = "redis6.x"
  description       = "Test elasticache redis."

  subnet_ids = data.aws_subnet_ids.all.ids
  vpc_id     = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  parameter = [
    {
      name  = "repl-backlog-size"
      value = "16384"
    }
  ]

  tags = {
    Project = "Test"
  }
}
