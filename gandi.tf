# see https://registry.terraform.io/providers/go-gandi/gandi/latest/docs/resources/nameservers
resource "gandi_nameservers" "domains" {
  for_each = aws_route53_zone.domains

  domain      = aws_route53_zone.domains[each.key].name
  nameservers = aws_route53_zone.domains[each.key].name_servers
}
