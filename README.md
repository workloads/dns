# Terraform Cloud Workspace `dns`

> This directory manages the lifecycle of the DNS Configuration for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace `dns`](#terraform-cloud-workspace-dns)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.5.x` or [newer](https://developer.hashicorp.com/packer/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.17.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| gandi_key | Gandi API Key. | `string` | yes |
| gandi_sharing_id | Gandi Sharing ID. | `string` | yes |
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| project_identifier | Human-readable Project Identifier. | `string` | yes |
| domains | Project-specific (public) Domains. | <pre>map(object({<br>    name                     = string<br>    acme_challenges          = optional(list(string))<br>    github_challenge         = optional(string)<br>    google_site_verification = optional(string)<br>    keybase_proof            = optional(string)<br>    onepassword_challenge    = optional(string)<br>    subdomains               = optional(list(string))<br>  }))</pre> | no |
| showcase_subdomains | Project-specific (public) Domains. | <pre>map(object({<br>    name             = string<br>    github_challenge = optional(string)<br>    keybase_proof    = optional(string)<br>  }))</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_route53_zone_domains | Exported Attributes for `aws_route53_zone.domains`. |
| aws_route53_zone_showcase_subdomains | Exported Attributes for `aws_route53_zone.showcase_subdomains`. |
| gandi_nameservers | Exported Attributes for `gandi_nameservers`. |
| google_search_console_urls | Google Search Console URLs. |
<!-- END_TF_DOCS -->

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/workloads/dns/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
