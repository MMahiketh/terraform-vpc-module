locals {

  # common locals
  resource_name = "${var.project}-${var.environment}"

  module_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}