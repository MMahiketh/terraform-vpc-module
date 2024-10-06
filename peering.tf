resource "aws_vpc_peering_connection" "this_default_vpcs" {
  count = local.is_peering_required

  vpc_id      = aws_vpc.main.id
  peer_vpc_id = data.aws_vpc.default.id
  auto_accept = true

  tags = merge(
    local.module_tags,
    { Name = "${local.resource_name}-default" },
    var.vpc_peering_tags
  )
}

# Routes
resource "aws_route" "public_peering" {
  count = local.is_peering_required

  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this_default_vpcs[0].id
}

resource "aws_route" "private_peering" {
  count = local.is_peering_required

  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this_default_vpcs[0].id
}

resource "aws_route" "database_peering" {
  count = local.is_peering_required

  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this_default_vpcs[0].id
}

resource "aws_route" "default_peering" {
  count = local.is_peering_required

  route_table_id            = data.aws_route_table.default.id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this_default_vpcs[0].id
}