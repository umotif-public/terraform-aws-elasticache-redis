resource "aws_elasticache_replication_group" "redis" {
  engine = "redis"

  parameter_group_name = aws_elasticache_parameter_group.redis.name
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = concat(var.security_group_ids, [aws_security_group.redis.id])

  replication_group_id  = "${var.name_prefix}-redis"
  number_cache_clusters = var.number_cache_clusters
  node_type             = var.node_type

  engine_version = var.engine_version
  port           = var.port

  maintenance_window         = var.maintenance_window
  snapshot_window            = var.snapshot_window
  snapshot_retention_limit   = var.snapshot_retention_limit
  automatic_failover_enabled = var.automatic_failover_enabled && var.number_cache_clusters > 1 ? true : false
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                 = var.auth_token != "" ? var.auth_token : null
  kms_key_id                 = var.kms_key_id

  apply_immediately = var.apply_immediately

  replication_group_description = var.description

  notification_topic_arn = var.notification_topic_arn

  tags = merge(
    {
      "Name" = "${var.name_prefix}-redis"
    },
    var.tags,
  )
}

resource "aws_elasticache_parameter_group" "redis" {
  name        = "${var.name_prefix}-redis-pg"
  family      = var.family
  description = var.description

  dynamic "parameter" {
    for_each = var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name        = "${var.name_prefix}-redis-sg"
  subnet_ids  = var.subnet_ids
  description = var.description
}

resource "aws_security_group" "redis" {
  name_prefix = "${var.name_prefix}-"
  vpc_id      = var.vpc_id

  tags = merge(
    {
      "Name" = "${var.name_prefix}-redis"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "redis_ingress_cidr_blocks" {
  count = length(var.ingress_cidr_blocks) != 0 ? 1 : 0

  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidr_blocks
  security_group_id = aws_security_group.redis.id
}

resource "aws_security_group_rule" "redis_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.redis.id
}

