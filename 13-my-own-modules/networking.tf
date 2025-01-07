module "networking-YS_Learnings" {
  source  = "ryogarajme/networking-YS_Learnings/aws"
  version = "0.1.1"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "YS_academy_vpc"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      public     = true
      az         = "us-east-1b"
    }
  }


}