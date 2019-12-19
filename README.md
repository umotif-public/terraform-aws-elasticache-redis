# terraform-aws-elasticache-redis

A Terraform module to create an AWS Redis ElastiCache cluster

## Resources created


## Terraform versions

Terraform 0.12. Pin module version to `~> v1.0`. Submit pull-requests to `master` branch.

## Usage

```hcl
module "redis" {
  source = "umotif-public/"
  version = "~> 1.0"


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

## License

See LICENSE for full details.