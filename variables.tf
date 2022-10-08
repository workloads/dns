variable "domains" {
  type = map(object({
    name             = string
    github_challenge = optional(string)
    keybase_proof    = optional(string)
  }))

  description = "Project-specific (public) Domains."

  default = {
    primary = {
      name             = "workloads.io"
      github_challenge = "3bba497d6f"
      keybase_proof    = "KXdzEmbMH4Jkd3oCzBmhug_iLivoDOo__a734lh58cw"
    }

    podcast = {
      name             = "workloads.fm"
      github_challenge = "3bba497d6f"
      keybase_proof    = "TPb7TTdqxDjq7f9BJ42w46G1usTAGFC6UQnJp5_-YZI"
    }
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

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}
