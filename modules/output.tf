output "vpc_id_output" {
  value = module.vpc.vpc_id_output
}

output "public_subnet_az1_id" {
  value = module.vpc.public_subnet_az1_id
}
output "public_subnet_az2_id" {
  value = module.vpc.public_subnet_az2_id
}
