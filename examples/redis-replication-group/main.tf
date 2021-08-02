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

data "aws_subnet_ids" "main" {
  vpc_id = data.aws_vpc.main.id
}

data "aws_subnet_ids" "replica" {
  vpc_id = data.aws_vpc.replica.id

  provider = aws.replica
}
#####
# Elasticache Redis
#####

module "redis_main" {
  source = "../../"

  name_prefix           = "redis-replication-example"
  number_cache_clusters = 2
  node_type             = "cache.m5.large"
  auth_token            = "1234567890asdfghjkl"

  subnet_ids = data.aws_subnet_ids.main.ids
  vpc_id     = data.aws_vpc.main.id
}

resource "aws_elasticache_global_replication_group" "this" {
  global_replication_group_id_suffix = "ha"
  primary_replication_group_id       = module.redis_main.elasticache_replication_group_id
}

module "redis_replica" {
  source = "../../"

  name_prefix           = "redis-replication-group-example"
  number_cache_clusters = 2
  node_type             = "cache.m5.large"
  auth_token            = "1234567890asdfghjkl"

  subnet_ids = data.aws_subnet_ids.replica.ids
  vpc_id     = data.aws_vpc.replica.id

  global_replication_group_id = aws_elasticache_global_replication_group.this.global_replication_group_id

  providers = { aws = aws.replica }
}
