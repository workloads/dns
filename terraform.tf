terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
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
    # see https://registry.terraform.io/providers/hashicorp/aws/4.49.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.49.0, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.52.0/
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.52.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/go-gandi/gandi/2.2.2
    gandi = {
      source  = "go-gandi/gandi"
      version = ">= 2.2.2, < 3.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.3.0"
}
