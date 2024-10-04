# Common variables
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

#vpc variables
variable "vpc_cidr_block" {
  type = string
}

variable "vpc_dns_hostnames" {
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(any)
  default = {}
}

# Internet GateWay variables
variable "igw_tags" {
  type    = map(any)
  default = {}
}

# Select Availability zones
variable "select_azs" {
  type    = list(number)
  default = [0, 1]

  validation {
    condition     = length(distinct(var.select_azs)) == 2 && min(var.select_azs...) >= 0 && max(var.select_azs...) < 6
    error_message = "selected_azs value must be a list of numbers with 2 distinct elements and elements value should be anything from the list=[0,1,2,3,4,5] "
  }
}