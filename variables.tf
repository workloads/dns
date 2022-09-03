variable "domains" {
  type = object({
    primary = string
  })

  description = "Project-specific (public) Domains."

  default = {
    primary = "workloads.io"
  }
}

variable "gandi_key" {
  type        = string
  description = "Gandi API Key."
  sensitive   = true
}

variable "gandi_sharing_id" {
  type        = string
  description = "Gandi Sharing ID."
  sensitive   = true
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
