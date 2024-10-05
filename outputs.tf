output "vpc_id" {
  value = aws_vpc.main.id
}

output "igw_id" {
  value = aws_internet_gateway.main.id
}


# for debugging
output "all_azs_info" {
  value = data.aws_availability_zones.all_azs
}

output "selected_azs" {
  value = local.selected_azs_names
}

output "az1_subnet_cidrs" {
  value = var.subnet_cidrs[0]
}

output "az2_subnet_cidrs" {
  value = var.subnet_cidrs[1]
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database[*].id
}

output "db_subnet_group_id" {
  value = aws_db_subnet_group.default.id
}