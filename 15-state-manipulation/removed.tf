# resource "aws_s3_bucket" "remove_bucket-1" {
#   bucket = "yogaraj-resource-name-2025"
# }

removed {
  from = aws_s3_bucket.remove_bucket-1
  lifecycle {
    destroy = true
  }

}