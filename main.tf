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

#Internet Gateway resource
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.module_tags,
    { Name = local.resource_name },
    var.igw_tags
  )
}

#subnet resources
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

resource "aws_subnet" "private" {
  count = length(var.subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index][1]
  availability_zone = local.selected_azs_names[count.index]

  tags = merge(
    local.module_tags,
    { Name = "${local.resource_name}-private-${local.selected_azs_names[count.index]}" },
    var.private_subnet_tags
  )
}

resource "aws_subnet" "database" {
  count = length(var.subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index][2]
  availability_zone = local.selected_azs_names[count.index]

  tags = merge(
    local.module_tags,
    { Name = "${local.resource_name}-database-${local.selected_azs_names[count.index]}" },
    var.database_subnet_tags
  )
}

resource "aws_db_subnet_group" "default" {
  name       = local.resource_name
  subnet_ids = aws_subnet.database[*].id

  tags = merge(
    local.module_tags,
    { Name = local.resource_name },
    var.db_subnet_group_tags
  )
}