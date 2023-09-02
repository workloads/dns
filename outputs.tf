output "aws_route53_zone_domains" {
  description = "Exported Attributes for `aws_route53_zone.domains`."
  value       = aws_route53_zone.domains
}

output "aws_route53_zone_subdomains" {
  description = "Exported Attributes for `aws_route53_zone.showcase_subdomains`."
  value       = aws_route53_zone.showcase_subdomains
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
