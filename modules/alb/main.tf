module "alb" {
  source            = "./modules/application-load-balancer"
  alb_name          = var.alb_name
  subnets           = var.subnets
  security_groups   = var.security_groups
  listener_port     = var.listener_port
  target_group_name = var.target_group_name
  target_group_port = var.target_group_port
  vpc_id            = var.vpc_id
}

