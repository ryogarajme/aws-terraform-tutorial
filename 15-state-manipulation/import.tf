# resource "aws_s3_bucket" "remote_bucket" {
#   bucket = "b5a8a4e2263e5cb7-ynrbucket2025"
#   tags = {
#     lifecycle  = "DO not delete bucket"
#     managed_by = "terraform"
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_s3_bucket_public_access_block" "remote_state" {
#   bucket = aws_s3_bucket.remote_bucket.bucket

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# import {
#   to = aws_s3_bucket_public_access_block.remote_state
#   id = aws_s3_bucket.remote_bucket.bucket
# }

removed {
  from = aws_s3_bucket_public_access_block.remote_state
  lifecycle {
    destroy = false
  }
}
removed {
  from = aws_s3_bucket.remote_bucket
  lifecycle {
    destroy = false
  }
}