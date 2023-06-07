provider "aws" {
  region = "eu-west-1"
}

#####
# VPC and subnets
#####
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#####
# External Security Group
#####
resource "aws_security_group" "other_sg" {
  vpc_id = data.aws_vpc.default.id
}

#####
# Elasticache Redis
#####
module "redis" {
  source = "../../"

  name_prefix        = "redis-basic-example"
  num_cache_clusters = 2
  node_type          = "cache.t4g.small"

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

  subnet_ids = data.aws_subnets.all.ids
  vpc_id     = data.aws_vpc.default.id

  allowed_security_groups = [aws_security_group.other_sg.id]

  ingress_cidr_blocks = ["0.0.0.0/0"]

  parameter = [
    {
      name  = "repl-backlog-size"
      value = "16384"
    }
  ]

  log_delivery_configuration = [
    {
      destination_type = "cloudwatch-logs"
      destination      = "aws_cloudwatch_log_group.henrique.name"
      log_format       = "json"
      log_type         = "engine-log"
    }
  ]

  tags = {
    Project = "Test"
  }
}
