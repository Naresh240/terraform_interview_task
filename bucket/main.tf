data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "example_acl" {
  bucket = aws_s3_bucket.example.id

  acl = var.bucket_acl
}