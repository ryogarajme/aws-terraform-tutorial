resource "aws_s3_bucket" "s3" {
  count  = var.bucket_count
  bucket = "workspace-bucket-${terraform.workspace}-${count.index}-${random_id.random.hex}"
}

resource "random_id" "random" {
  byte_length = 8
}