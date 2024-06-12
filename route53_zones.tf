# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "domains" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = var.domains

  name    = each.value.name
  comment = "Terraform-managed DNS Zone for ${var.project_identifier}."
}

# create Route53 Zones for each item listed in CSP Configuration
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "svcs_dev_subdomains" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset(var.domains.svcs_dev.subdomains)

  name    = "${each.value}.${var.domains.svcs_dev.name}"
  comment = "Terraform-managed DNS Zone for CSP Configuration-specific Subdomain for ${var.project_identifier}."
}
