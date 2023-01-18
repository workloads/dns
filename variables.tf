variable "domains" {
  type = map(object({
    name             = string
    github_challenge = optional(string)
    keybase_proof    = optional(string)
    subdomains       = optional(list(string))
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
      github_challenge = "5eeba6976a"
      keybase_proof    = "TPb7TTdqxDjq7f9BJ42w46G1usTAGFC6UQnJp5_-YZI"
    }

    showcase = {
      name             = "svcs.dev"
      github_challenge = "2b19dbea14"
      keybase_proof    = "lixGZ9wCZokUw3C3vOq1bRhggwlvrN6t48EJYlZ3Uuw"

      subdomains = [
        "aws", # Amazon Web Services
        "az",  # Microsoft Azure
        "do",  # Digital Ocean
        "gcp", # Google Cloud
        "swy", # Scaleway
      ]
    }
  }
}

variable "showcase_subdomains" {
  type = map(object({
    name             = string
    github_challenge = optional(string)
    keybase_proof    = optional(string)
  }))

  description = "Project-specific (public) Domains."

  default = {
    primary = {
      name = "aws"
    }

    podcast = {
      name             = "workloads.fm"
      github_challenge = "3bba497d6f"
      keybase_proof    = "TPb7TTdqxDjq7f9BJ42w46G1usTAGFC6UQnJp5_-YZI"
    }

    showcase = {
      name             = "svcs.dev"
      github_challenge = "7b234873f8"
      keybase_proof    = "lixGZ9wCZokUw3C3vOq1bRhggwlvrN6t48EJYlZ3Uuw"
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
