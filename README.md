# terraform-aws-elasticache-redis

A Terraform module to create an AWS Redis ElastiCache cluster

## Terraform versions

Terraform 0.12. Pin module version to `~> v1.0`. Submit pull-requests to `master` branch.

## Usage

```hcl
module "redis" {
  source = "umotif-public/elasticache-redis/aws"
  version = "~> 1.0.0"

  name_prefix           = "core-example"
  number_cache_clusters = 2
  node_type             = "cache.t3.small"

  engine_version           = "5.0.6"
  port                     = 6379
  maintenance_window       = "mon:03:00-mon:04:00"
  snapshot_window          = "04:00-06:00"
  snapshot_retention_limit = 7

  automatic_failover_enabled = true

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = "1234567890asdfghjkl"

  apply_immediately = true
  family            = "redis5.0"
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

  tags = {
    Project = "Test"
  }
}
```

## Assumptions

Module is to be used with Terraform > 0.12.

## Examples

* [Elasicache Redis](https://github.com/umotif-public/terraform-aws-elasticache-redis/tree/master/examples/core)

## Authors

Module managed by [Marcin Cuber](https://github.com/marcincuber) [linkedin](https://www.linkedin.com/in/marcincuber/).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| at\_rest\_encryption\_enabled | Whether to enable encryption at rest. | `bool` | `true` | no |
| auth\_token | The password used to access a password protected server. Can be specified only if `transit_encryption_enabled = true`. | `string` | `""` | no |
| auto\_minor\_version\_upgrade | n/a | `string` | `true` | no |
| automatic\_failover\_enabled | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool` | `true` | no |
| description | The description of the all resources. | `string` | `"Managed by Terraform"` | no |
| engine\_version | The version number of the cache engine to be used for the cache clusters in this replication group. | `string` | `"5.0.6"` | no |
| family | The family of the ElastiCache parameter group. | `string` | `"redis5.0"` | no |
| ingress\_cidr\_blocks | List of Ingress CIDR blocks. | `list(string)` | `[]` | no |
| kms\_key\_id | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if `at_rest_encryption_enabled = true` | `string` | `""` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `""` | no |
| name\_prefix | The replication group identifier. This parameter is stored as a lowercase string. | `string` | n/a | yes |
| node\_type | The compute and memory capacity of the nodes in the node group. | `string` | n/a | yes |
| notification\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: `arn:aws:sns:us-east-1:012345678999:my_sns_topic` | `string` | `""` | no |
| number\_cache\_clusters | The number of cache clusters (primary and replicas) this replication group will have. | `number` | n/a | yes |
| parameter | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| port | The port number on which each of the cache nodes will accept connections. | `number` | `6379` | no |
| security\_group\_ids | List of Security Groups. | `list(string)` | `[]` | no |
| snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `30` | no |
| snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `""` | no |
| subnet\_ids | List of VPC Subnet IDs for the cache subnet group. | `list(string)` | n/a | yes |
| tags | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| transit\_encryption\_enabled | Whether to enable encryption in transit. | `bool` | `true` | no |
| vpc\_id | VPC Id to associate with Redis ElastiCache. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| elasticache\_auth\_token | The Redis Auth Token |
| elasticache\_parameter\_group\_id | The ElastiCache parameter group name. |
| elasticache\_replication\_group\_id | The ID of the ElastiCache Replication Group. |
| elasticache\_replication\_group\_member\_clusters | The identifiers of all the nodes that are part of this replication group. |
| elasticache\_replication\_group\_primary\_endpoint\_address | The address of the endpoint for the primary node in the replication group. |
| security\_group\_arn | The ARN of the Redis ElastiCache security group. |
| security\_group\_description | The description of the Redis ElastiCache security group. |
| security\_group\_egress | The egress rules of the Redis ElastiCache security group. |
| security\_group\_id | The ID of the Redis ElastiCache security group. |
| security\_group\_ingress | The ingress rules of the Redis ElastiCache security group. |
| security\_group\_name | The name of the Redis ElastiCache security group. |
| security\_group\_owner\_id | The owner ID of the Redis ElastiCache security group. |
| security\_group\_vpc\_id | The VPC ID of the Redis ElastiCache security group. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE for full details.

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```