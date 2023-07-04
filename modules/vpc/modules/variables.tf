variable "aws_region" {}
variable "project_name" {}
variable "vpc_cidr" {}
# variables for private subnet
# # private app
# variable "private_app_subnet_az1" {}
# variable "private_app_subnet_az2" {}
# variable "private_app_subnet_az1_cidr" {}
# variable "private_app_subnet_az2_cidr" {}
# # private data
# variable "private_data_subnet_az1" {}
# variable "private_data_subnet_az2" {}
# variable "private_data_subnet_az1_cidr" {}
# variable "private_data_subnet_az2_cidr" {}
# variable "cidr_out_sg" {}
# variable name for public subnets
variable "public_subnet_az1" {}
variable "public_subnet_az2" {}
# variable cidr for public subnets
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
# egress cidr blocks
# variable "egress_cidr_blocks" {
#   type    = list(string)
#   default = []
# }
variable "vpc_tags" {}
