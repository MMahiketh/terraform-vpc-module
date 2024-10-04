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