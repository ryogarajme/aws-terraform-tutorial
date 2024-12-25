locals {
  common_tags = {
    Name       = "tf-vpc"
    managed_by = "terraform"
    Env        = "dev"
    CostCenter = "YNR"
  }
}