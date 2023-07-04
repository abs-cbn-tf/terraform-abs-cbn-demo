variable "aws_region" {}
# variables for apigw
variable "apigw_name" {}
variable "resource_name" {}
variable "method_name" {}
variable "stage_name" {}
variable "api_key" {}
variable "usage_plan" {}

# variables for lambda
variable "function_name" {}
variable "runtime" {}
variable "handler" {}
variable "iam_role_name" {}
variable "memory" {}

# environment variables for lambda
variable "env_var" {
  type = map(string)
}
variable "my_lambda_tags" {
  type = map(string)
}

# ALB VARIABLES
# variable "vpc_id" {}
# variable "public_subnets" {}
# variable "security_groups" {}
# variable "ecs_security_groups" {}
variable "listener_port" {}
variable "target_group_name" {}
variable "target_group_port" {}
# variable "listener_cert_arn" {}
variable "alb_name" {}

# ECS CLUSTER VARIABLES 
variable "tf_my_cluster" {}
variable "tf_capacity_provider" {}

#ECS SERVICE VARIABLES
variable "task_family" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "task_role_name" {}
variable "network_mode" {}

# Container Definition Variables
variable "container_name" {}
variable "container_image" {}
variable "container_cpu" {}
variable "container_memory" {}
variable "container_cport" {}
variable "container_hport" {}
variable "container_protocol" {}
variable "requires_compatibilities" {}
variable "operating_system" {}
variable "cpu_architecture" {}

# Variables for the service
variable "service_name" {}

variable "service_role_name" {}

# variable "public_subnets" {}

# for vpc 
variable "project_name" {}
variable "vpc_cidr" {}
# variable name for public subnets
variable "public_subnet_az1" {}
variable "public_subnet_az2" {}
# variable cidr for public subnets
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "vpc_tags" {}

# for security group
