output "s3_bucket" {
    value = aws_s3_bucket.bucket.bucket
    description = "name of bucket"
    sensitive = true
}

output "my_sensitive_value" {
    value = var.my_sensitive_value
    description = "sensitive value"
    sensitive = true
}