variable "domains" {
  type = map(object({
    name                  = string
    acme_challenges       = optional(list(string))
    github_challenge      = optional(string)
    keybase_proof         = optional(string)
    onepassword_challenge = optional(string)
    subdomains            = optional(list(string))
  }))

  description = "Project-specific (public) Domains."

  default = {
    primary = {
      name                  = "workloads.io"
      github_challenge      = "3bba497d6f"
      keybase_proof         = "KXdzEmbMH4Jkd3oCzBmhug_iLivoDOo__a734lh58cw"
      onepassword_challenge = "2NYM25O4RJDX3ILS4AJP42QGHE"
    }

    podcast = {
      name                  = "workloads.fm"
      github_challenge      = "5eeba6976a"
      keybase_proof         = "TPb7TTdqxDjq7f9BJ42w46G1usTAGFC6UQnJp5_-YZI"
      onepassword_challenge = "TKF76WM2JBGQFNYQXIRPYK4LA4"
    }

    showcase = {
      name = "svcs.dev"

      acme_challenges = [
        "TsFD07SzwHyIe0fLmjda5Lq2eu4d9_gCTk4QptwCby0",
        "JRrcDuN5LQbRMv3BTNjfphpabPKZ1U_ZArP8g0LdwCc",
        "Lsp8ZUJApBqmPvcc1s7E-t4ZuZvI3TKHY1Fx6aE-SnE",
      ]

      github_challenge = "2b19dbea14"
      keybase_proof    = "lixGZ9wCZokUw3C3vOq1bRhggwlvrN6t48EJYlZ3Uuw"

      onepassword_challenge = "IP7JH24TSNEFTFMYJKXUL5B62A"

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
