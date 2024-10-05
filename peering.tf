resource "aws_vpc_peering_connection" "this_default_vpcs" {
  count = local.is_peering_required

  vpc_id      = aws_vpc.main.id
  peer_vpc_id = data.aws_vpc.default
  auto_accept = true

  tags = merge(
    local.module_tags,
    { Name = "${local.resource_name}-default" },
    var.vpc_peering_tags
  )
}