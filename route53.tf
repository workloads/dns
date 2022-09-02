# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "domains" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = var.domains

  name = each.value
}

module "github_verification" {
  # see https://registry.terraform.io/modules/ksatirli/route53-github-verification/aws/2.0.0
  source  = "ksatirli/route53-github-verification/aws"
  version = "2.0.0"

  github_organization = "${var.project_identifier}-org"
  ownership_record    = "3bba497d6f"
  zone_id             = aws_route53_zone.domains["primary"].zone_id
}
module "keybase_domain_proofs" {
  # TODO: replace with Registry reference
  source = "github.com/ksatirli/terraform-aws-route53-keybase-domain-proof?ref=updates-and-upgrades"

  domain_proof    = "KXdzEmbMH4Jkd3oCzBmhug_iLivoDOo__a734lh58cw"
  zone_id             = aws_route53_zone.domains["primary"].zone_id
}

module "workmail_records" {
  # see https://registry.terraform.io/modules/ksatirli/route53-workmail-records/aws/2.0.0
  source  = "ksatirli/route53-workmail-records/aws"
  version = "2.0.0"

  workmail_zone = "us-west-2"
  zone_id       = aws_route53_zone.domains["primary"].zone_id
}
