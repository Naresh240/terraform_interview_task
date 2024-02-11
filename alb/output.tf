output "alb_arn" {
    value = aws_lb.alb-example.arn
}

output "dns_name" {
    value = aws_lb.alb-example.dns_name
}

output "zone_id" {
    value = aws_lb.alb-example.zone_id
}