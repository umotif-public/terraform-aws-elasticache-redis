provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "replica"
}

#####
# VPC and subnets
#####

data "aws_vpc" "main" {
  default = true
}

data "aws_vpc" "replica" {
  default = true

  provider = aws.replica
}

data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

data "aws_subnets" "replica" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.replica.id]
  }

  provider = aws.replica
}
#####
# Elasticache Redis
#####

module "redis_main" {
  source = "../../"

  name_prefix        = "redis-example-main"
  num_cache_clusters = 2
  node_type          = "cache.m7g.large"
  auth_token         = "1234567890asdfghjkl"

  subnet_ids = data.aws_subnets.main.ids
  vpc_id     = data.aws_vpc.main.id

  tags = {
    Project     = "Github"
    Environment = "test"
  }
}

resource "aws_elasticache_global_replication_group" "this" {
  global_replication_group_id_suffix = "ha"
  primary_replication_group_id       = module.redis_main.elasticache_replication_group_id
}

module "redis_replica" {
  source = "../../"

  name_prefix        = "redis-example-replica"
  num_cache_clusters = 2
  node_type          = "cache.m7g.large"
  auth_token         = "1234567890asdfghjkl"

  subnet_ids = data.aws_subnets.replica.ids
  vpc_id     = data.aws_vpc.replica.id

  global_replication_group_id = aws_elasticache_global_replication_group.this.global_replication_group_id

  providers = { aws = aws.replica }

  tags = {
    Project     = "Github"
    Environment = "test"
  }
}
