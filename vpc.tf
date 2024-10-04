# vpc resource
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.vpc_dns_hostnames

  tags = merge(
    local.module_tags,
    { Name = local.resource_name },
    var.vpc_tags
  )
}