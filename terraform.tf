terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/cloud
  cloud {
    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "dns"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.60.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.60.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/go-gandi/gandi/2.3.0
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.3.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.94.0
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.94.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.57.0
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.57.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.9.0, < 2.0.0"
}
