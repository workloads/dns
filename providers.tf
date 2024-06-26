# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  region = var.management_region_aws

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      "github:url" = "https://github.com/workloads/dns"
    }
  }
}

# The Gandi Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/go-gandi/gandi/latest/docs#authentication
provider "gandi" {
  personal_access_token = var.gandi_personal_access_token
}
