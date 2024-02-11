data "aws_route53_zone" "example" {
  name         = var.hosted_zone_name
}
resource "aws_route53_record" "wordpress" {
  zone_id = data.aws_route53_zone.example.zone_id
  name    = "${var.name}.${data.aws_route53_zone.example.name}"
  type    = "A"
  alias {
    name                   =var.dns_name
    zone_id                = var.zone_id
    evaluate_target_health = true
  }
}