# VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
  description = "The ID of the main VPC"
}

# Public Subnet IDs
output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
  description = "List of Public Subnet IDs"
}

# Private Subnet IDs
output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
  description = "List of Private Subnet IDs"
}

# VPN Gateway ID
output "vpn_gateway_id" {
  value = aws_vpn_gateway.vpn.id
  description = "The ID of the VPN Gateway"
}

# Customer Gateway ID
output "customer_gateway_id" {
  value = aws_customer_gateway.example.id
  description = "The ID of the Customer Gateway"
}

# VPN Connection ID
output "vpn_connection_id" {
  value = aws_vpn_connection.example.id
  description = "The ID of the VPN Connection"
}

# Public NACL IDs
output "public_nacl_ids" {
  value = aws_network_acl.public_nacl[*].id
  description = "List of Public Network ACL IDs"
}

# Private NACL IDs
output "private_nacl_ids" {
  value = aws_network_acl.private_nacl[*].id
  description = "List of Private Network ACL IDs"
}

# Security Group IDs for Public Subnets
output "public_sg_ids" {
  value = aws_security_group.public_sg.id
  description = "The Security Group ID for the Public Subnets"
}

# Security Group IDs for Private Subnets
output "private_sg_ids" {
  value = aws_security_group.private_sg.id
  description = "The Security Group ID for the Private Subnets"
}

# Availability Zones used
output "availability_zones" {
  value = data.aws_availability_zones.available.names
  description = "The availability zones used in the VPC"
}