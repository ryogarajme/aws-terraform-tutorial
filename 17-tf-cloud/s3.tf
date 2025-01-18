resource "aws_s3_bucket" "this" {
  bucket = "terrafrom-cloud-bucket-2025-${random_id.this.hex}"

  tags = {
    createdBy = "TF-Cloud"
  }
}