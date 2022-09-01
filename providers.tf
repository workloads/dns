# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  region = var.management_region_aws
}

# The Gandi Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/go-gandi/gandi/latest/docs#authentication
provider "gandi" {
  key        = "pN0dbCfZGyUHlqeXn3avkSRG"             # TODO
  sharing_id = "f71e2666-2995-11ed-b2fb-00163e94b645" # TODO
}
