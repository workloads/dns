variable "domains" {
  type = object({
    primary = string
  })

  description = "Project-specific (public) Domains."

  default = {
    primary = "workloads.io"
  }
}

variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

# tflint-ignore: terraform_unused_declarations
variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}
