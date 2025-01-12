output "rds_instance_id" {
  value = aws_db_instance.this.id
  description = "RDS Instance ID"
}

output "rds_instance_arn" {
  value = aws_db_instance.this.arn
  description = "RDS Instance arn"
}

output "rds_endpoint_url" {
  value = aws_db_instance.this.endpoint
  description = "RDS Instance endpoint"
}

output "rds_address" {
  value = aws_db_instance.this.address
  description = "RDS Instance address"
}

output "rds_port" {
  value = aws_db_instance.this.port
  description = "RDS Instance port"
}