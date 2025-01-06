locals {
  project_name = "devops"
  common_tags = {
    project       = local.project_name
    maintained_by = "terraform"
  }
}