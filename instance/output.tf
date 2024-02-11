output "public_ips" {
    value = aws_instance.example.*.public_ip
}

output "instance_ids" {
    value = aws_instance.example.*.id
}