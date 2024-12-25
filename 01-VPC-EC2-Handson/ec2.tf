resource "aws_instance" "web" {
  ami                         = "ami-01816d07b1128cd2d"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub_subnet.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = merge(local.common_tags, {
    Name = "web_server"
  })

  lifecycle {
    create_before_destroy = true
    ignore_changes = [ tags ]
  }

}

# resource "aws_eip" "ec2_eip" {

# }