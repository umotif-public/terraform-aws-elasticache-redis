output "primary_endpoint" {
  value = module.redis.elasticache_replication_group_primary_endpoint_address
}

output "reader_endpoint" {
  value = module.redis.elasticache_replication_group_reader_endpoint_address
}
