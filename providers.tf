# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  region = var.management_region_aws
}

# The Gandi Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/go-gandi/gandi/latest/docs#authentication
provider "gandi" {}
