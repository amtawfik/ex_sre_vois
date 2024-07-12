resource "aws_route53_zone" "r53-zone" {
    name = var.domain_name
}

resource "aws_route53_record" "this" {
    alias {
        evaluate_target_health = true
        name                   = var.api_gateway_endpoint
        zone_id                = var.api_gateway_zone_id
    }
    name    = var.domain_name
    type    = "A"
    zone_id = aws_route53_zone.r53-zone.zone_id
}

output "zone_id" {
    value = aws_route53_zone.r53-zone.zone_id
}
