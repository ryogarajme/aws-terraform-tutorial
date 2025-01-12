module "rds" {
  source = "./modules/rds"
  credentials = {
    username = "ysadmin"
    password = "1234abc+?_1"
  }
  project_name   = "ys-rds"
  instance_class = "db.t3.micro"
  storage_size   = 10
  security_group_ids = [
    aws_security_group.complaint.id
  ]
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}