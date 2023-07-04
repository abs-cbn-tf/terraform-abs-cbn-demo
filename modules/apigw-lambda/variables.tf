variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

# variables for apigw
variable "apigw_name" {
  description = "Name for apigw"
  type        = string
  default     = "terraform-apigw"
}

variable "resource_name" {
  description = "Name for the resource"
  type        = string
  default     = "{proxy+}"
}

variable "method_name" {
  description = "Name for the method"
  type        = string
  default     = "ANY"
}

variable "stage_name" {
  description = "Name for stage"
  type        = string
  default     = "dev"
}

variable "api_key" {
  description = "Name for api key"
  type        = string
  default     = "terraform_api_key"
}

variable "usage_plan" {
  description = "Name for usage plan"
  type        = string
  default     = "terraform_usage_plan"
}

# variables for lambda
# Input Variables
variable "function_name" {
  description = "aws region"
  type        = string
}

variable "runtime" {
  description = "runtime"
  type        = string
}

variable "handler" {
  description = "handler"
  type        = string
}

variable "iam_role_name" {
  description = "role name"
  type        = string
}

variable "memory" {
  description = "memory size"
  type        = string
}

variable "env_var" {
  description = "Environment variables for lambda"
  type        = map(string)
  default     = {}
}

variable "my_lambda_tags" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default     = {}
}
