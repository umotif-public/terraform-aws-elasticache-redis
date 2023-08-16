# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]

- chore(snapshot): Allow restore from a snapshot ([#46](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/46))
- feat(subnet_group): Allow to pass an existing subnet group ([#44](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/44))


<a name="3.4.0"></a>
## [3.4.0] - 2023-07-14

- Remove provider max version constraints ([#47](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/47))


<a name="3.3.0"></a>
## [3.3.0] - 2023-04-20

- Add User Group ID support ([#39](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/39))
- fix: Type of multi_az_enabled variable ([#36](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/36))
- Allow to skip sg egress rules creation ([#40](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/40))


<a name="3.1.4"></a>
## [3.1.4] - 2022-07-13



<a name="3.2.0"></a>
## [3.2.0] - 2022-07-13

- Documentation + Examples cleanup ([#33](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/33))


<a name="3.1.3"></a>
## [3.1.3] - 2022-07-12

- Add Data Tiering support ([#32](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/32))


<a name="3.1.2"></a>
## [3.1.2] - 2022-05-26

- fix example in README ([#30](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/30))


<a name="3.1.1"></a>
## [3.1.1] - 2022-05-12

- Fix outputs for endpoints ([#29](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/29))


<a name="3.1.0"></a>
## [3.1.0] - 2022-05-12

- Allow other sg ingress ([#24](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/24))
- Support Redis log delivery ([#26](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/26))


<a name="3.0.0"></a>
## [3.0.0] - 2022-03-09

- Upgrade module to be compatible with AWS Provider 4.0.0 ([#21](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/21))


<a name="2.2.0"></a>
## [2.2.0] - 2021-08-11

- Add support for global_replication_group_id ([#19](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/19))


<a name="2.1.0"></a>
## [2.1.0] - 2021-06-11

- Update docs and use main branch as default ([#18](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/18))
- Add tags support to all resources ([#17](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/17))


<a name="2.0.0"></a>
## [2.0.0] - 2021-04-19

- Terraform 0.15 support by marking outputs as sensitive ([#15](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/15))


<a name="1.5.0"></a>
## [1.5.0] - 2021-02-02

- Add support for multi-az and final snapshot ([#12](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/12))
- Update README.md


<a name="1.4.0"></a>
## [1.4.0] - 2020-12-08

- Add support for availability_zones parameter ([#11](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/11))


<a name="1.3.1"></a>
## [1.3.1] - 2020-11-12

- Update outputs + docs ([#9](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/9))


<a name="1.3.0"></a>
## [1.3.0] - 2020-11-10

- Add support for clustered mode and upgrade fixes ([#8](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/8))


<a name="1.2.0"></a>
## [1.2.0] - 2020-11-09

- Add self sg ingress rule option ([#7](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/7))


<a name="1.1.1"></a>
## [1.1.1] - 2020-11-09

- Update module to remove 0.14 limit ([#6](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/6))


<a name="1.1.0"></a>
## [1.1.0] - 2020-08-20

- Update main.tf


<a name="1.0.3"></a>
## [1.0.3] - 2020-08-05

- Feature/v3 provider support ([#4](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/4))
- Feature/updates ([#3](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/3))
- add git hooks and update docs
- Update README.md


<a name="1.0.2"></a>
## [1.0.2] - 2020-01-03

- improve typing ([#1](https://github.com/umotif-public/terraform-aws-elasticache-redis/issues/1))


<a name="1.0.1"></a>
## [1.0.1] - 2019-12-20

- add support for custom sg and notification_topic_arn


<a name="1.0.0"></a>
## 1.0.0 - 2019-12-19

- add redis configuration
- Initial commit of docs


[Unreleased]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.4.0...HEAD
[3.4.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.3.0...3.4.0
[3.3.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.1.4...3.3.0
[3.1.4]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.2.0...3.1.4
[3.2.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.1.3...3.2.0
[3.1.3]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.1.2...3.1.3
[3.1.2]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.1.1...3.1.2
[3.1.1]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.1.0...3.1.1
[3.1.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/3.0.0...3.1.0
[3.0.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/2.2.0...3.0.0
[2.2.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/2.1.0...2.2.0
[2.1.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.5.0...2.0.0
[1.5.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.4.0...1.5.0
[1.4.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.3.1...1.4.0
[1.3.1]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.3.0...1.3.1
[1.3.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.1.1...1.2.0
[1.1.1]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.1.0...1.1.1
[1.1.0]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.0.3...1.1.0
[1.0.3]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/umotif-public/terraform-aws-elasticache-redis/compare/1.0.0...1.0.1
