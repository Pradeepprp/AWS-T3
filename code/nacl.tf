# Public NACL for Subnets in Public Subnets (one per AZ)
resource "aws_network_acl" "public_nacl" {
  count   = 3
  vpc_id  = aws_vpc.main.id

  tags = {
    Name = "PublicNACL-AZ${count.index + 1}"
  }
}

# Private NACL for Subnets in Private Subnets (one per AZ)
resource "aws_network_acl" "private_nacl" {
  count   = var.num_availability_zones * 3 # 3 NACLs per AZ
  vpc_id  = aws_vpc.main.id

  tags = {
    Name = "PrivateNACL-AZ${count.index + 1}"
  }
}

# Rules for Public NACLs (HTTP, HTTPS, Outbound)
resource "aws_network_acl_rule" "allow_http_public" {
  count          = 3
  network_acl_id = aws_network_acl.public_nacl[count.index].id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "allow_https_public" {
  count          = 3
  network_acl_id = aws_network_acl.public_nacl[count.index].id
  rule_number    = 101
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "allow_outbound_public" {
  count          = 3
  network_acl_id = aws_network_acl.public_nacl[count.index].id
  rule_number    = 102
  egress         = true
  protocol       = "-1"  # All protocols
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# Rules for Private NACLs (Inbound, Outbound)
resource "aws_network_acl_rule" "allow_inbound_private" {
  count          = 3
  network_acl_id = aws_network_acl.private_nacl[count.index].id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"  # Replace with your VPC CIDR block
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow_outbound_private" {
  count          = 3
  network_acl_id = aws_network_acl.private_nacl[count.index].id
  rule_number    = 101
  egress         = true
  protocol       = "-1"  # All protocols
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# NACL Associations for all AZs

# Public Subnet Associations
resource "aws_network_acl_association" "public_subnet_association" {
  count             = var.num_availability_zones
  subnet_id         = aws_subnet.public_subnet[count.index].id
  network_acl_id    = aws_network_acl.public_nacl[count.index].id
  depends_on        = [aws_subnet.public_subnet]
}

# Private Subnet Associations
resource "aws_network_acl_association" "private_subnet_association" {
  count          = var.num_availability_zones * 3 # Create associations for all private subnets
  subnet_id      = aws_subnet.private_subnet[count.index].id
  network_acl_id = aws_network_acl.private_nacl[count.index].id

  depends_on = [aws_subnet.private_subnet]
}