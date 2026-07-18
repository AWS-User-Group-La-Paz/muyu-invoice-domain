resource "aws_route53_zone" "parent" {
  name = "muyuinvoices.click"
}

resource "aws_route53_record" "tenant_delegation" {
  for_each = var.tenants

  zone_id = aws_route53_zone.parent.zone_id
  name    = "${each.key}.${aws_route53_zone.parent.name}"
  type    = "NS"
  ttl     = 300
  records = sort(tolist(each.value))
}
