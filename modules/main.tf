# resources on a single main.tf
module "apigw-lambda" {
  source        = "./apigw-lambda"
  aws_region    = var.aws_region
  function_name = var.function_name

  # variables for lambda
  iam_role_name  = var.iam_role_name
  runtime        = var.runtime
  handler        = var.handler
  memory         = var.memory
  env_var        = var.env_var
  my_lambda_tags = var.my_lambda_tags

  # variables for apigw
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan

  #   lambda_invoke_arn = module.lambda_function.invoke_arn
}

module "ecs-alb" {
  depends_on = [module.vpc, module.push-web-ecs-service-sg, module.push-web-sg]
  source     = "./ecs-alb"
  # alb
  vpc_id              = module.vpc.vpc_id_output
  alb_name            = var.alb_name
  public_subnets      = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  security_groups     = [module.push-web-sg.security_group_id]
  ecs_security_groups = [module.push-web-ecs-service-sg.security_group_id]
  listener_port       = var.listener_port
  target_group_name   = var.target_group_name
  target_group_port   = var.target_group_port

  # cluster
  tf_capacity_provider = var.tf_capacity_provider
  tf_my_cluster        = var.tf_my_cluster

  # service
  task_family    = var.task_family
  task_role_name = var.task_role_name
  task_cpu       = var.task_cpu
  task_memory    = var.task_memory
  network_mode   = var.network_mode

  # container_definitions = var.container_definitions
  container_name     = var.container_name
  container_image    = var.container_image
  container_cpu      = var.container_cpu
  container_memory   = var.container_memory
  container_cport    = var.container_cport
  container_hport    = var.container_hport
  container_protocol = var.container_protocol

  requires_compatibilities = var.requires_compatibilities
  operating_system         = var.operating_system
  cpu_architecture         = var.cpu_architecture

  # service 
  service_name           = var.service_name
  service_role_name      = var.service_role_name
  project_name           = var.project_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az1      = var.public_subnet_az1
  public_subnet_az2_cidr = var.public_subnet_az2_cidr
  public_subnet_az2      = var.public_subnet_az2
  vpc_tags               = var.vpc_tags
}

#for vpc
module "vpc" {
  source                 = "./vpc/modules"
  aws_region             = var.aws_region
  project_name           = var.project_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az1      = var.public_subnet_az1
  public_subnet_az2_cidr = var.public_subnet_az2_cidr
  public_subnet_az2      = var.public_subnet_az2
  vpc_tags               = var.vpc_tags
}

# for security group
module "push-web-ecs-service-sg" {
  depends_on  = [module.vpc]
  source      = "./sg/modules/security_group"
  description = "push-web-ecs-service-sg"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = false
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self        = false
    }
  ]

  name = "push-web-ecs-service-sg"
  tags = {
    Backup               = "False"
    OwnerTeamEmail       = "mardelacruz@abs-cbn.com"
    "abscbn-bus-unit"    = "DCT"
    "abscbn-cost-centre" = "61250"
    "abscbn-criticality" = "Silver"
    "abscbn-env"         = "UAT"
    "abscbn-product"     = "ent"
    "abscbn-url"         = "pushweb.abs-cbn.com"
  }
  vpc_id = module.vpc.vpc_id_output
}
module "push-web-sg" {
  depends_on  = [module.vpc]
  source      = "./sg/modules/security_group"
  description = "push-web-sg"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = false
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self        = false
    }
  ]

  name = "push-web-sg"
  tags = {
    Backup               = "False"
    OwnerTeamEmail       = "mardelacruz@abs-cbn.com"
    "abscbn-bus-unit"    = "DCT"
    "abscbn-cost-centre" = "61250"
    "abscbn-criticality" = "Silver"
    "abscbn-env"         = "UAT"
    "abscbn-product"     = "ent"
    "abscbn-url"         = "pushweb.abs-cbn.com"
  }
  vpc_id = module.vpc.vpc_id_output
}
