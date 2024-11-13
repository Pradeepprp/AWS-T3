# Outputs for VPC and VPN
output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpn_gateway_id" {
  value = aws_vpn_gateway.vpn.id
}

output "customer_gateway_id" {
  value = aws_customer_gateway.example.id
}

output "vpn_connection_id" {
  value = aws_vpn_connection.example.id
}

/*
output "route53_zone_id" {
  value = aws_route53_zone.main.zone_id
}
*/

# Outputs for Public Subnets
output "public_subnet_az1_id" {
  value       = aws_subnet.public_subnet_az1.id
  description = "ID of the Public Subnet in AZ1"
}

output "public_subnet_az2_id" {
  value       = aws_subnet.public_subnet_az2.id
  description = "ID of the Public Subnet in AZ2"
}

# Outputs for Private Subnets in AZ1
output "private_subnet_az1_1_id" {
  value       = aws_subnet.private_subnet_az1_1.id
  description = "ID of Private Subnet 1 in AZ1"
}

output "private_subnet_az1_2_id" {
  value       = aws_subnet.private_subnet_az1_2.id
  description = "ID of Private Subnet 2 in AZ1"
}

output "private_subnet_az1_3_id" {
  value       = aws_subnet.private_subnet_az1_3.id
  description = "ID of Private Subnet 3 in AZ1"
}

# Outputs for Private Subnets in AZ2
output "private_subnet_az2_1_id" {
  value       = aws_subnet.private_subnet_az2_1.id
  description = "ID of Private Subnet 1 in AZ2"
}

output "private_subnet_az2_2_id" {
  value       = aws_subnet.private_subnet_az2_2.id
  description = "ID of Private Subnet 2 in AZ2"
}

output "private_subnet_az2_3_id" {
  value       = aws_subnet.private_subnet_az2_3.id
  description = "ID of Private Subnet 3 in AZ2"
}

# Outputs for Network ACLs
output "public_nacl_az1_id" {
  value       = aws_network_acl.public_nacl_az1.id
  description = "ID of the Public Network ACL for AZ1"
}

output "public_nacl_az2_id" {
  value       = aws_network_acl.public_nacl_az2.id
  description = "ID of the Public Network ACL for AZ2"
}

output "private_nacl_az1_id" {
  value       = aws_network_acl.private_nacl_az1.id
  description = "ID of the Private Network ACL for AZ1"
}

output "private_nacl_az2_id" {
  value       = aws_network_acl.private_nacl_az2.id
  description = "ID of the Private Network ACL for AZ2"
}

# Outputs for Security Groups
output "public_security_group_id" {
  value       = aws_security_group.public_sg.id
  description = "ID of the Public Security Group"
}

output "private_security_group_id" {
  value       = aws_security_group.private_sg.id
  description = "ID of the Private Security Group"
}