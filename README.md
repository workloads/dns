# HCP Terraform Workspace `dns`

> This repository manages DNS Configuration for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [HCP Terraform Workspace `dns`](#hcp-terraform-workspace-dns)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

* HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| gandi_api_key | Gandi API Key. | `string` | yes |
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| project_identifier | Human-readable Project Identifier. | `string` | yes |
| domains | Project-specific (public) Domains. | <pre>map(object({<br>    name                     = string<br>    github_challenge         = optional(string)<br>    google_site_verification = optional(string)<br>    keybase_proof            = optional(string)<br>    onepassword_challenge    = optional(string)<br>    subdomains               = optional(list(string))<br>  }))</pre> | no |
| record_ttl | TTL of DNS Records. | `number` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_route53_zone_domains | Exported Attributes for `aws_route53_zone.domains`. |
| aws_route53_zone_svcs_dev_subdomains | Exported Attributes for `aws_route53_zone.svcs_dev_subdomains`. |
| gandi_nameservers | Exported Attributes for `gandi_nameservers`. |
| google_search_console_urls | Google Search Console URLs. |
<!-- END_TF_DOCS -->

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/dns/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
