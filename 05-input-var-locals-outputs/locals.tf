locals {
  project_name  = "input-var-locals-outputs"
  project_owner = "YS-learning"
  cost_center   = "1234"
  managed_by    = "terraform"
}

locals {
  common_tags = {
    project = local.project_name
    owner       = local.project_owner
    cost_center = local.cost_center
    managed_by  = local.managed_by
    sensitive_tag = var.my_sensitive_value
  }
}