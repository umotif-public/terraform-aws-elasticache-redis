[![GitHub release (latest by date)](https://img.shields.io/github/v/release/umotif-public/terraform-aws-elasticache-redis)](https://github.com/umotif-public/terraform-aws-elasticache-redis/releases/latest)

# terraform-aws-elasticache-redis

A Terraform module to create an AWS Redis ElastiCache cluster

## Terraform versions

- For AWS Provider >= 4.0.0, pin module version to `~> v3.0`.
- For Terraform 0.14.5 and higher *and* AWS Provider < 4.0.0, pin module version to `~> v2.0`.
- For Terraform 0.12 to 0.14.4, pin module version to `~> v1.0`.
- Submit pull-requests to `main` branch.

## Usage

```hcl
module "redis" {
  source = "umotif-public/elasticache-redis/aws"
  version = "~> 3.0.0"

  name_prefix           = "core-example"
  num_cache_clusters    = 2
  node_type             = "cache.t4g.small"

  engine_version           = "6.x"
  port                     = 6379
  maintenance_window       = "mon:03:00-mon:04:00"
  snapshot_window          = "04:00-06:00"
  snapshot_retention_limit = 7

  automatic_failover_enabled = true

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = "1234567890asdfghjkl"

  apply_immediately = true
  family            = "redis6.x"
  description       = "Test elasticache redis."

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

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
      destination      = "aws_cloudwatch_log_group.example.name"
      log_format       = "json"
      log_type         = "engine-log"
    }
  ]

  tags = {
    Project = "Test"
  }
}
```

## Examples

- [Redis Basic](https://github.com/umotif-public/terraform-aws-elasticache-redis/tree/main/examples/redis-basic)
- [Redis Clustered Mode](https://github.com/umotif-public/terraform-aws-elasticache-redis/tree/main/examples/redis-clustered-mode)
- [Redis Replication Group](https://github.com/umotif-public/terraform-aws-elasticache-redis/tree/main/examples/redis-replication-group)

## Authors

Module managed by [uMotif](https://github.com/umotif-public/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.8.0, < 5.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.3.2, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.8.0, < 5.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.3.2, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.other_sg_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.redis_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.redis_ingress_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.redis_ingress_self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [random_id.redis_pg](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_security_groups"></a> [allowed\_security\_groups](#input\_allowed\_security\_groups) | List of existing security groups that will be allowed ingress via the elaticache security group rules | `list(string)` | `[]` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Whether to enable encryption at rest. | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | The password used to access a password protected server. Can be specified only if `transit_encryption_enabled = true`. | `string` | `""` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | n/a | `string` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, number\_cache\_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. | `bool` | `true` | no |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | Enable creation of a native redis cluster. | `bool` | `false` | no |
| <a name="input_data_tiering_enabled"></a> [data\_tiering\_enabled](#input\_data\_tiering\_enabled) | Enables data tiering. Data tiering is only supported for replication groups using the r6gd node type. This parameter must be set to true when using r6gd nodes. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the all resources. | `string` | `"Managed by Terraform"` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | List of Egress CIDR blocks. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version number of the cache engine to be used for the cache clusters in this replication group. | `string` | `"6.x"` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group. | `string` | `"redis6.x"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made. | `string` | `null` | no |
| <a name="input_global_replication_group_id"></a> [global\_replication\_group\_id](#input\_global\_replication\_group\_id) | The ID of the global replication group to which this replication group should belong. | `string` | `null` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | List of Ingress CIDR blocks. | `list(string)` | `[]` | no |
| <a name="input_ingress_self"></a> [ingress\_self](#input\_ingress\_self) | Specify whether the security group itself will be added as a source to the ingress rule. | `bool` | `false` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if `at_rest_encryption_enabled = true` | `string` | `""` | no |
| <a name="input_log_delivery_configuration"></a> [log\_delivery\_configuration](#input\_log\_delivery\_configuration) | Log Delivery configuration for the cluster. | <pre>list(object({<br>    destination_type = string<br>    destination      = string<br>    log_format       = string<br>    log_type         = string<br>  }))</pre> | `[]` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `""` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Specifies whether to enable Multi-AZ Support for the replication group. If true, `automatic_failover_enabled` must also be enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The replication group identifier. This parameter is stored as a lowercase string. | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The compute and memory capacity of the nodes in the node group. | `string` | n/a | yes |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: `arn:aws:sns:us-east-1:012345678999:my_sns_topic` | `string` | `""` | no |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | The number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. Updates will occur before other modifications. Conflicts with num\_node\_groups. | `number` | `1` | no |
| <a name="input_num_node_groups"></a> [num\_node\_groups](#input\_num\_node\_groups) | Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications. | `number` | `0` | no |
| <a name="input_parameter"></a> [parameter](#input\_parameter) | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which each of the cache nodes will accept connections. | `number` | `6379` | no |
| <a name="input_preferred_cache_cluster_azs"></a> [preferred\_cache\_cluster\_azs](#input\_preferred\_cache\_cluster\_azs) | A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important. | `list(string)` | `null` | no |
| <a name="input_replicas_per_node_group"></a> [replicas\_per\_node\_group](#input\_replicas\_per\_node\_group) | Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will trigger an online resizing operation before other settings modifications. | `number` | `0` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of Security Groups. | `list(string)` | `[]` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `30` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `""` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | The name of the subnet group. If it is not specified, the module will create one for you | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC Subnet IDs for the cache subnet group. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Whether to enable encryption in transit. | `bool` | `true` | no |
| <a name="input_user_group_ids"></a> [user\_group\_ids](#input\_user\_group\_ids) | User Group ID to associate with the replication group | `list(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC Id to associate with Redis ElastiCache. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_auth_token"></a> [elasticache\_auth\_token](#output\_elasticache\_auth\_token) | The Redis Auth Token. |
| <a name="output_elasticache_parameter_group_id"></a> [elasticache\_parameter\_group\_id](#output\_elasticache\_parameter\_group\_id) | The ElastiCache parameter group name. |
| <a name="output_elasticache_port"></a> [elasticache\_port](#output\_elasticache\_port) | The Redis port. |
| <a name="output_elasticache_replication_group_arn"></a> [elasticache\_replication\_group\_arn](#output\_elasticache\_replication\_group\_arn) | The Amazon Resource Name (ARN) of the created ElastiCache Replication Group. |
| <a name="output_elasticache_replication_group_id"></a> [elasticache\_replication\_group\_id](#output\_elasticache\_replication\_group\_id) | The ID of the ElastiCache Replication Group. |
| <a name="output_elasticache_replication_group_member_clusters"></a> [elasticache\_replication\_group\_member\_clusters](#output\_elasticache\_replication\_group\_member\_clusters) | The identifiers of all the nodes that are part of this replication group. |
| <a name="output_elasticache_replication_group_primary_endpoint_address"></a> [elasticache\_replication\_group\_primary\_endpoint\_address](#output\_elasticache\_replication\_group\_primary\_endpoint\_address) | The address of the endpoint for the primary node in the replication group. |
| <a name="output_elasticache_replication_group_reader_endpoint_address"></a> [elasticache\_replication\_group\_reader\_endpoint\_address](#output\_elasticache\_replication\_group\_reader\_endpoint\_address) | The address of the endpoint for the reader node in the replication group. |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the Redis ElastiCache security group. |
| <a name="output_security_group_description"></a> [security\_group\_description](#output\_security\_group\_description) | The description of the Redis ElastiCache security group. |
| <a name="output_security_group_egress"></a> [security\_group\_egress](#output\_security\_group\_egress) | The egress rules of the Redis ElastiCache security group. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Redis ElastiCache security group. |
| <a name="output_security_group_ingress"></a> [security\_group\_ingress](#output\_security\_group\_ingress) | The ingress rules of the Redis ElastiCache security group. |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the Redis ElastiCache security group. |
| <a name="output_security_group_owner_id"></a> [security\_group\_owner\_id](#output\_security\_group\_owner\_id) | The owner ID of the Redis ElastiCache security group. |
| <a name="output_security_group_vpc_id"></a> [security\_group\_vpc\_id](#output\_security\_group\_vpc\_id) | The VPC ID of the Redis ElastiCache security group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE for full details.

## Pre-commit hooks

### Install dependencies

- [`pre-commit`](https://pre-commit.com/#install)
- [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
- [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```
