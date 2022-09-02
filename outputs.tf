output "aws_route53_zone" {
  description = "Exported Attributes for `aws_route53_zone`."
  value       = aws_route53_zone.domains
}

output "gandi_nameservers" {
  description = "Exported Attributes for `gandi_nameservers`."
  value       = gandi_nameservers.domains
}
