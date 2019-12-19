## Example deployment flow

```bash
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name\_prefix | The replication group identifier. This parameter is stored as a lowercase string. | string | n/a | yes |
| node\_type | The compute and memory capacity of the nodes in the node group. | string | n/a | yes |
| number\_cache\_clusters | The number of cache clusters (primary and replicas) this replication group will have. | string | n/a | yes |
| subnet\_ids | List of VPC Subnet IDs for the cache subnet group. | list(string) | n/a | yes |
| vpc\_id | VPC Id to associate with Redis ElastiCache. | string | n/a | yes |
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window. | string | `"false"` | no |
| at\_rest\_encryption\_enabled | Whether to enable encryption at rest. | string | `"true"` | no |
| auth\_token | The password used to access a password protected server. Can be specified only if `transit_encryption_enabled = true`. | string | `""` | no |
| auto\_minor\_version\_upgrade |  | string | `"true"` | no |
| automatic\_failover\_enabled | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | string | `"true"` | no |
| description | The description of the all resources. | string | `"Managed by Terraform"` | no |
| engine\_version | The version number of the cache engine to be used for the cache clusters in this replication group. | string | `"5.0.0"` | no |
| family | The family of the ElastiCache parameter group. | string | `"redis5.0"` | no |
| ingress\_cidr\_blocks | List of Ingress CIDR blocks. | list(string) | `[]` | no |
| kms\_key\_id | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if `at_rest_encryption_enabled = true` | string | `""` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. | string | `""` | no |
| parameter | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | object | `[]` | no |
| port | The port number on which each of the cache nodes will accept connections. | string | `"6379"` | no |
| snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | string | `"30"` | no |
| snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | string | `""` | no |
| source\_security\_group\_ids | List of Security Groups. | list(string) | `[]` | no |
| tags | A mapping of tags to assign to all resources. | map(string) | `{}` | no |
| transit\_encryption\_enabled | Whether to enable encryption in transit. | string | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
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
