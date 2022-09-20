terraform {
  # see https://www.terraform.io/language/settings/terraform-cloud
  cloud {
    # see https://www.terraform.io/cli/cloud/settings#organization
    organization = "workloads"

    # see https://www.terraform.io/cli/cloud/settings#workspaces
    workspaces {
      name = "dns"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/4.31.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.31.0, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.44.0/
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.44.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/go-gandi/gandi/2.1.0
    gandi = {
      source  = "go-gandi/gandi"
      version = ">= 2.1.0, < 3.0.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.2.9"
}
