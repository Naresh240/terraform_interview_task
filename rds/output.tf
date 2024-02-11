output "rdsendpoint" {
    value = aws_db_instance.example.address
}

output "dbname" {
    value = aws_db_instance.example.identifier
}