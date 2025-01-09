resource "aws_s3_bucket" "tainted" {
  bucket = "my-tainted-bucket-afdsafdsaffwerqwrqwerwqerew"

}

resource "aws_s3_bucket_public_access_block" "from_tainted" {
  bucket = aws_s3_bucket.tainted.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
}