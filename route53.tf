# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "domains" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = var.domains

  name    = each.value.name
  comment = "Terraform-managed DNS Zone for ${var.project_identifier}."
}

# create subdomains for each showcase provider
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "showcase_subdomains" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset(var.domains.showcase.subdomains)

  name    = "${each.value}.${var.domains.showcase.name}"
  comment = "Terraform-managed DNS Zone for Provider-specific Subdomain for ${var.project_identifier}."
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

  # see https://registry.terraform.io/modules/ksatirli/route53-keybase-domain-proof/aws/2.1.0
  source  = "ksatirli/route53-keybase-domain-proof/aws"
  version = "2.1.0"

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

  apex_txt_record_append = [
    # see https://support.1password.com/breach-report/
    "1password-site-verification=${var.domains[each.key].onepassword_challenge}",

    # see https://support.google.com/webmasters/answer/9008080
    "google-site-verification=${var.domains[each.key].google_site_verification}"
  ]
}

# Special Record for Let's Encrypt DNS Challenge
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "showcase_txt" {
  zone_id = aws_route53_zone.domains["showcase"].zone_id
  name    = aws_route53_zone.domains["showcase"].name
  type    = "TXT"
  ttl     = 300

  # see https://developer.hashicorp.com/terraform/language/functions/concat
  records = [
    "1password-site-verification=${var.domains["showcase"].onepassword_challenge}",
    "google-site-verification=${var.domains["showcase"].google_site_verification}"
  ]
}

# Special Record for Let's Encrypt DNS Challenge
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "showcase_acme_challenges_txt" {
  zone_id = aws_route53_zone.domains["showcase"].zone_id
  name    = "_acme-challenge.${aws_route53_zone.domains["showcase"].name}"
  type    = "TXT"
  ttl     = 300

  records = var.domains["showcase"].acme_challenges
}

# Special Record for HTTP interface of https://github.com/ksatirli/breakpoint
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "showcase_breakpoint_a" {
  zone_id = aws_route53_zone.domains["showcase"].zone_id
  name    = "breakpoint.${aws_route53_zone.domains["showcase"].name}"
  type    = "A"
  ttl     = 300

  records = [
    "127.0.0.1"
  ]
}

# Special Record for HTTP interface of https://github.com/ksatirli/breakpoint
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "showcase_breakpoint_aaaa" {
  zone_id = aws_route53_zone.domains["showcase"].zone_id
  name    = "breakpoint.${aws_route53_zone.domains["showcase"].name}"
  type    = "AAAA"
  ttl     = 300

  records = [
    "::1"
  ]
}
