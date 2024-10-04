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

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.module_tags,
    { Name = local.resource_name },
    var.igw_tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index][0]
  availability_zone = local.selected_azs_names[count.index]

  tags = merge(
    local.module_tags,
    { Name = "${local.resource_name}-public-${local.selected_azs_names[count.index]}" },
    var.public_subnet_tags
  )
}