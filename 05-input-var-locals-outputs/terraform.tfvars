instance_type = "t3.xlarge"

root_block_device = {
  volume_size = 10
  volume_type = "gp2"
}

additional_tags = {
  Managed_by = "terraform"
}