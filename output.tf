# Accessing outputs from the module "parameters_inclusion"

# VPC ID
output "vpc_id" {
  value = module.parameters_inclusion.vpc_id
  description = "The ID of the main VPC"
}

# Public Subnet IDs
output "public_subnet_ids" {
  value = module.parameters_inclusion.public_subnet_ids
  description = "List of Public Subnet IDs"
}

# Private Subnet IDs
output "private_subnet_ids" {
  value = module.parameters_inclusion.private_subnet_ids
  description = "List of Private Subnet IDs"
}

# VPN Gateway ID
output "vpn_gateway_id" {
  value = module.parameters_inclusion.vpn_gateway_id
  description = "The ID of the VPN Gateway"
}

# Customer Gateway ID
output "customer_gateway_id" {
  value = module.parameters_inclusion.customer_gateway_id
  description = "The ID of the Customer Gateway"
}

# VPN Connection ID
output "vpn_connection_id" {
  value = module.parameters_inclusion.vpn_connection_id
  description = "The ID of the VPN Connection"
}

# Public NACL IDs
output "public_nacl_ids" {
  value = module.parameters_inclusion.public_nacl_ids
  description = "List of Public Network ACL IDs"
}

# Private NACL IDs
output "private_nacl_ids" {
  value = module.parameters_inclusion.private_nacl_ids
  description = "List of Private Network ACL IDs"
}

# Security Group IDs for Public Subnets
output "public_sg_ids" {
  value = module.parameters_inclusion.public_sg_ids
  description = "The Security Group ID for the Public Subnets"
}

# Security Group IDs for Private Subnets
output "private_sg_ids" {
  value = module.parameters_inclusion.private_sg_ids
  description = "The Security Group ID for the Private Subnets"
}

# Availability Zones used
output "availability_zones" {
  value = module.parameters_inclusion.availability_zones
  description = "The availability zones used in the VPC"
}