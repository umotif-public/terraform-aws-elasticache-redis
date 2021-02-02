variable "name_prefix" {
  type        = string
  description = "The replication group identifier. This parameter is stored as a lowercase string."
}

variable "number_cache_clusters" {
  type        = number
  description = "The number of cache clusters (primary and replicas) this replication group will have."
}

variable "node_type" {
  type        = string
  description = "The compute and memory capacity of the nodes in the node group."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of VPC Subnet IDs for the cache subnet group."
}

variable "vpc_id" {
  type        = string
  description = "VPC Id to associate with Redis ElastiCache."
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "List of Ingress CIDR blocks."
  default     = []
}

variable "ingress_self" {
  type        = bool
  description = "Specify whether the security group itself will be added as a source to the ingress rule."
  default     = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of Security Groups."
  default     = []
}

variable "engine_version" {
  default     = "5.0.6"
  type        = string
  description = "The version number of the cache engine to be used for the cache clusters in this replication group."
}

variable "port" {
  default     = 6379
  type        = number
  description = "The port number on which each of the cache nodes will accept connections."
}

variable "maintenance_window" {
  default     = ""
  type        = string
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
}

variable "snapshot_window" {
  default     = ""
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
}

variable "snapshot_retention_limit" {
  default     = 30
  type        = number
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
}

variable "auto_minor_version_upgrade" {
  default = true
  type    = string
}

variable "automatic_failover_enabled" {
  default     = true
  type        = bool
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

variable "at_rest_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable encryption at rest."
}

variable "transit_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable encryption in transit."
}

variable "apply_immediately" {
  default     = false
  type        = bool
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "family" {
  default     = "redis5.0"
  type        = string
  description = "The family of the ElastiCache parameter group."
}

variable "description" {
  default     = "Managed by Terraform"
  type        = string
  description = "The description of the all resources."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "auth_token" {
  type        = string
  description = "The password used to access a password protected server. Can be specified only if `transit_encryption_enabled = true`."
  default     = ""
}

variable "kms_key_id" {
  type        = string
  description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if `at_rest_encryption_enabled = true`"
  default     = ""
}

variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
}

variable "notification_topic_arn" {
  type        = string
  default     = ""
  description = "An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: `arn:aws:sns:us-east-1:012345678999:my_sns_topic`"
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Enable creation of a native redis cluster."
  default     = false
}

variable "replicas_per_node_group" {
  type        = number
  default     = 0
  description = "Required when `cluster_mode_enabled` is set to true. Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource."
}

variable "num_node_groups" {
  type        = number
  default     = 0
  description = "Required when `cluster_mode_enabled` is set to true. Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications."
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important."
  default     = null
}

variable "multi_az_enabled" {
  type        = string
  description = "Specifies whether to enable Multi-AZ Support for the replication group. If true, `automatic_failover_enabled` must also be enabled. Defaults to false."
  default     = null
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made."
  default     = null
}
