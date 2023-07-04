module "tfer--push-web-ecs-service-sg" {
  source      = "./modules/security_group"
  description = "push-web-ecs-service-sg"

  ingress_rules = [
    {
      from_port   = 3000
      to_port     = 3000
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
  vpc_id = "vpc-0cb8ff7dd4bdb15d2"
}

module "tfer--push-web-sg" {
  source      = "./modules/security_group"
  description = "push-web-sg"

  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
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
  vpc_id = "vpc-0cb8ff7dd4bdb15d2"
}

# module "tfer--AllowSSH_sg" {
#   source      = "./modules/security_group"
#   description = "AllowSSH"

#   ingress_rules = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       self        = false
#     }
#   ]

#   egress_rules = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#       self        = false
#     }
#   ]

#   name    = "AllowSSH"
#   tags    = {
#     Backup             = "False"
#     OwnerTeamEmail     = "mardelacruz@abs-cbn.com"
#     "abscbn-bus-unit"    = "DCT"
#     "abscbn-cost-centre" = "61250"
#     "abscbn-criticality" = "Silver"
#     "abscbn-env"         = "UAT"
#     "abscbn-product"     = "entertainment"
#     "abscbn-url"         = "abs-cbn.com"
#   }
#   vpc_id  = "vpc-0cb8ff7dd4bdb15d2"
# }

# module "tfer--default_sg" {
#   source      = "./modules/security_group"
#   description = "default VPC security group"

#   ingress_rules = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#       self        = true
#     }
#   ]

#   egress_rules = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#       self        = false
#     }
#   ]

#   name    = "default1"
#   tags    = {
#     Backup             = "False"
#     OwnerTeamEmail     = "mardelacruz@abs-cbn.com"
#     "abscbn-bus-unit"    = "DCT"
#     "abscbn-cost-centre" = "61250"
#     "abscbn-criticality" = "Silver"
#     "abscbn-env"         = "UAT"
#     "abscbn-product"     = "entertainment"
#     "abscbn-url"         = "abs-cbn.com"
#   }
#   vpc_id  = "vpc-00d590bddaf6ae228"
# }
