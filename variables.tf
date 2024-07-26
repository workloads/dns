variable "domains" {
  type = map(object({
    name                     = string
    github_challenge         = optional(string)
    google_site_verification = optional(string)
    keybase_proof            = optional(string)
    onepassword_challenge    = optional(string)
    subdomains               = optional(list(string))
  }))

  description = "Project-specific (public) Domains."

  default = {
    svcs_dev = {
      name                     = "svcs.dev"
      github_challenge         = "2b19dbea14"
      google_site_verification = "ewzgQe2JqLh1NtW7UNrJOz_q9qS8v60XNufRwJWc2dw"
      keybase_proof            = "AXT59FZrv3btmhs7FVT9AIlLn90CZ5iYpSIJo2WEtAg"
      onepassword_challenge    = "IP7JH24TSNEFTFMYJKXUL5B62A"

      # TODO: make this consume var.csp_configuration
      subdomains = [
        "aws", # Amazon Web Services
        "az",  # Microsoft Azure
        "do",  # Digital Ocean
        "gcp", # Google Cloud
        "scw", # Scaleway
      ]
    }

    workloads_app = {
      name                     = "workloads.app"
      github_challenge         = "77b4be4f07"
      google_site_verification = "kSwKJzFopsfIjM2I43S_J1pVc4jEDHonnB3DLPPx98o"
      keybase_proof            = "aJqgAoEi9QTo6_FhC2y75snwQy4-QLIxOwhNEwePjzE"
      onepassword_challenge    = "FK4AXLF7G5EAFCD5TNAGKPYHNU"
    }

    workloads_fm = {
      name                     = "workloads.fm"
      github_challenge         = "5eeba6976a"
      google_site_verification = "w5tKDDBaHP6bAcA0FbEQMdK0BFEeTGHANAH1jvegKR4"
      keybase_proof            = "TPb7TTdqxDjq7f9BJ42w46G1usTAGFC6UQnJp5_-YZI"
      onepassword_challenge    = "TKF76WM2JBGQFNYQXIRPYK4LA4"
    }

    workloads_io = {
      name                     = "workloads.io"
      github_challenge         = "3bba497d6f"
      google_site_verification = "N-tRaaMzY2lKmS8FAR5wYQPXLy1-igPHFUyUhMDrTvc"
      keybase_proof            = "KXdzEmbMH4Jkd3oCzBmhug_iLivoDOo__a734lh58cw"
      onepassword_challenge    = "2NYM25O4RJDX3ILS4AJP42QGHE"
    }

    workloads_run = {
      name                     = "workloads.run"
      github_challenge         = "22b0874a2d"
      google_site_verification = "D_UQvC64cM9jLbMWrjAqFRvqlbIZktoaWkN8eWYsWGQ"
      keybase_proof            = "J-53RDP5dJ-f8dt_IRUdmUlykOhRgRRsau-vixcb7so"
      onepassword_challenge    = "OK76JLK6UFHYTHLQFCVCFRVXBM"
    }
  }
}

variable "gandi_api_key" {
  type        = string
  description = "Gandi API Key."
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

variable "record_ttl" {
  type = number
  description = "TTL of DNS Records."
  default = 300
}
