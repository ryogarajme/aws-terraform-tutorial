resource "aws_s3_bucket" "bucket" {
  bucket = "${local.project_name}-${random_id.bucket_suffix.hex}"

  tags = merge(local.common_tags, var.additional_tags, {
    Name = "S3 Bucket"
  })
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}