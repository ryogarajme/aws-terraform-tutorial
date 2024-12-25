output "static_endpoint" {
  value = "${aws_s3_bucket.static_bucket.bucket}.s3-website-${data.aws_region.current.name}.amazonaws.com"
}