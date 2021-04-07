output "elasticache_replication_group_arn" {
  value       = var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].arn : aws_elasticache_replication_group.redis[0].arn
  description = "The Amazon Resource Name (ARN) of the created ElastiCache Replication Group."
}

output "elasticache_replication_group_id" {
  value       = var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].id : aws_elasticache_replication_group.redis[0].id
  description = "The ID of the ElastiCache Replication Group."
}

output "elasticache_replication_group_primary_endpoint_address" {
  value = var.cluster_mode_enabled ? (
    var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].configuration_endpoint_address : aws_elasticache_replication_group.redis[0].configuration_endpoint_address
    ) : (
    var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].primary_endpoint_address : aws_elasticache_replication_group.redis[0].primary_endpoint_address
  )
  description = "The address of the endpoint for the primary node in the replication group."
}

output "elasticache_replication_group_reader_endpoint_address" {
  value = var.cluster_mode_enabled ? (
    var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].configuration_endpoint_address : aws_elasticache_replication_group.redis[0].configuration_endpoint_address
    ) : (
    var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].reader_endpoint_address : aws_elasticache_replication_group.redis[0].reader_endpoint_address
  )
  description = "The address of the endpoint for the reader node in the replication group."
}

output "elasticache_replication_group_member_clusters" {
  value       = var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].member_clusters : aws_elasticache_replication_group.redis[0].member_clusters
  description = "The identifiers of all the nodes that are part of this replication group."
}

output "elasticache_parameter_group_id" {
  value       = aws_elasticache_parameter_group.redis.id
  description = "The ElastiCache parameter group name."
}

output "security_group_id" {
  value       = aws_security_group.redis.id
  description = "The ID of the Redis ElastiCache security group."
}

output "security_group_arn" {
  value       = aws_security_group.redis.arn
  description = "The ARN of the Redis ElastiCache security group."
}

output "security_group_vpc_id" {
  value       = aws_security_group.redis.vpc_id
  description = "The VPC ID of the Redis ElastiCache security group."
}

output "security_group_owner_id" {
  value       = aws_security_group.redis.owner_id
  description = "The owner ID of the Redis ElastiCache security group."
}

output "security_group_name" {
  value       = aws_security_group.redis.name
  description = "The name of the Redis ElastiCache security group."
}

output "security_group_description" {
  value       = aws_security_group.redis.description
  description = "The description of the Redis ElastiCache security group."
}

output "security_group_ingress" {
  value       = aws_security_group.redis.ingress
  description = "The ingress rules of the Redis ElastiCache security group."
}

output "security_group_egress" {
  value       = aws_security_group.redis.egress
  description = "The egress rules of the Redis ElastiCache security group."
}

output "elasticache_auth_token" {
  description = "The Redis Auth Token."
  value       = var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].auth_token : aws_elasticache_replication_group.redis[0].auth_token
}

output "elasticache_port" {
  description = "The Redis port."
  value       = var.prevent_destroy ? aws_elasticache_replication_group.redis_no_destroy[0].port : aws_elasticache_replication_group.redis[0].port
}
