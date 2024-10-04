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