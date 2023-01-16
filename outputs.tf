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
