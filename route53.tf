# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "domains" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = var.domains

  name    = each.value.name
  comment = "Terraform-managed DNS Zone for ${var.project_identifier}."
}

module "github_verification" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = aws_route53_zone.domains

  # see https://registry.terraform.io/modules/ksatirli/route53-github-verification/aws/2.0.0
  source  = "ksatirli/route53-github-verification/aws"
  version = "2.0.0"

  # GitHub Organizations require `-org` suffix, personal accounts do not
  github_organization = "${var.project_identifier}-org"
  ownership_record    = var.domains[each.key].github_challenge
  zone_id             = aws_route53_zone.domains[each.key].zone_id
}

module "keybase_domain_proofs" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = aws_route53_zone.domains

  # see https://registry.terraform.io/modules/ksatirli/route53-keybase-domain-proof/aws/2.0.0
  source  = "ksatirli/route53-keybase-domain-proof/aws"
  version = "2.0.0"

  domain_proof = var.domains[each.key].keybase_proof
  zone_id      = aws_route53_zone.domains[each.key].zone_id
}

module "workmail_records" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset([
    "primary",
    "podcast",
  ])

  # see https://registry.terraform.io/modules/ksatirli/route53-workmail-records/aws/2.0.0
  source  = "ksatirli/route53-workmail-records/aws"
  version = "2.0.0"

  workmail_zone = "us-west-2"
  zone_id       = aws_route53_zone.domains[each.key].zone_id
}
