aws_region = "ap-southeast-1"
# variables for apigw
apigw_name    = "IMP-APIGW"
resource_name = "{proxy+}"
method_name   = "ANY"
stage_name    = "dev"
api_key       = "imp-api-key"
usage_plan    = "imp-usage-plan"

# variables for lambda
function_name = "imp-test-api"
runtime       = "nodejs18.x"
handler       = "index.handler"
iam_role_name = "imp-test-api-role"
memory        = 128
env_var = {
  var1 = "tfvars1"
  var2 = "tfvars2"
}
my_lambda_tags = {
  Application = "Push"
  Environment = "Demo"
}
# ALB VARIABLES
# vpc_id          = "vpc-0c9d173ca36c1610b"
# subnets         = ["subnet-038237e2c544512b2", "subnet-06444596eafdc15d2"]
# security_groups = ["sg-00e85456726ee4964"]

listener_port     = 80
target_group_name = "imp-alb-tg"
target_group_port = 80
# listener_cert_arn
alb_name = "imp-alb"

# ECS CLUSTER VARIABLES 
tf_my_cluster        = "imp-cluster"
tf_capacity_provider = "FARGATE_SPOT"

#ECS SERVICE VARIABLES
task_family    = "imp-taskdef"
task_cpu       = "1024"
task_memory    = "2048"
task_role_name = "imp-taskdef-role"
network_mode   = "awsvpc"

# Container Definition Variables
container_name     = "my-container"
container_image    = "nginx:latest"
container_cpu      = 256
container_memory   = 512
container_cport    = 80
container_hport    = 80
container_protocol = "tcp"
# EOF Container Definitions Variables
requires_compatibilities = "FARGATE"
operating_system         = "LINUX"
cpu_architecture         = "X86_64"

# Variables for the service
service_name      = "IMP-Service"
service_role_name = "IMP-service-role"
# public_subnets      = ["subnet-038237e2c544512b2", "subnet-06444596eafdc15d2"]
# ecs_security_groups = ["sg-0991ab42e756b2450"]

# Variables for the VPC
project_name           = "IMP"
vpc_cidr               = "10.193.176.0/21"
public_subnet_az1_cidr = "10.193.176.0/25"
public_subnet_az1      = "Public-Subnet-A-IMP"
public_subnet_az2_cidr = "10.193.176.128/25"
public_subnet_az2      = "Public-Subnet-B-IMP"

vpc_tags = {
  Name    = "imp-vpc"
  Env     = "demo"
  project = "imp"
  #  foo = "bar"
}
# Variables for Security group
