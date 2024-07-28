output "aws_route53_zone_domains" {
  description = "Exported Attributes for `aws_route53_zone.domains`."
  value       = aws_route53_zone.domains
}

output "aws_route53_zone_svcs_dev_subdomains" {
  description = "Exported Attributes for `aws_route53_zone.svcs_dev_subdomains`."
  value       = aws_route53_zone.svcs_dev_subdomains
}

output "gandi_nameservers" {
  description = "Exported Attributes for `gandi_nameservers`."
  value       = gandi_nameservers.domains
}

output "google_search_console_urls" {
  description = "Google Search Console URLs."

  # iterate over Repository Objects and assign `full_name` as value
  value = {
    for identifier, domain in var.domains : identifier => "https://search.google.com/search-console?resource_id=sc-domain%3A${domain.name}"
  }
}

output "tfe_workspace_terraform_version" {
  description = "Terraform version identifier of current HCP Terraform Workspace."
  value       = data.tfe_workspace.main.terraform_version
}
