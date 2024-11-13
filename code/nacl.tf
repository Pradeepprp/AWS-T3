# Public NACL for Subnets in Public Subnets (one per AZ)
resource "aws_network_acl" "public_nacl_az1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PublicNACL-AZ1"
  }
}

resource "aws_network_acl" "public_nacl_az2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PublicNACL-AZ2"
  }
}

# Private NACL for Subnets in Private Subnets (one per AZ)
resource "aws_network_acl" "private_nacl_az1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PrivateNACL-AZ1"
  }
}

resource "aws_network_acl" "private_nacl_az2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "PrivateNACL-AZ2"
  }
}

# Rules for Public NACLs
resource "aws_network_acl_rule" "allow_http_public_az1" {
  network_acl_id = aws_network_acl.public_nacl_az1.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "allow_https_public_az1" {
  network_acl_id = aws_network_acl.public_nacl_az1.id
  rule_number    = 101
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "allow_outbound_public_az1" {
  network_acl_id = aws_network_acl.public_nacl_az1.id
  rule_number    = 102
  egress         = true
  protocol       = "-1"  # All protocols
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# Repeat the rules for the second public NACL (AZ2)
resource "aws_network_acl_rule" "allow_http_public_az2" {
  network_acl_id = aws_network_acl.public_nacl_az2.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "allow_https_public_az2" {
  network_acl_id = aws_network_acl.public_nacl_az2.id
  rule_number    = 101
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "allow_outbound_public_az2" {
  network_acl_id = aws_network_acl.public_nacl_az2.id
  rule_number    = 102
  egress         = true
  protocol       = "-1"  # All protocols
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# Rules for Private NACLs
resource "aws_network_acl_rule" "allow_inbound_private_az1" {
  network_acl_id = aws_network_acl.private_nacl_az1.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"  # Replace with your VPC CIDR block
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow_outbound_private_az1" {
  network_acl_id = aws_network_acl.private_nacl_az1.id
  rule_number    = 101
  egress         = true
  protocol       = "-1"  # All protocols
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# Repeat the rules for the second private NACL (AZ2)
resource "aws_network_acl_rule" "allow_inbound_private_az2" {
  network_acl_id = aws_network_acl.private_nacl_az2.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"  # Replace with your VPC CIDR block
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow_outbound_private_az2" {
  network_acl_id = aws_network_acl.private_nacl_az2.id
  rule_number    = 101
  egress         = true
  protocol       = "-1"  # All protocols
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

# NACL Associations

# Public Subnets
resource "aws_network_acl_association" "public_subnet_az1_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  network_acl_id = aws_network_acl.public_nacl_az1.id
}

resource "aws_network_acl_association" "public_subnet_az2_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  network_acl_id = aws_network_acl.public_nacl_az2.id
}

# Private Subnets in AZ1
resource "aws_network_acl_association" "private_subnet_az1_1_association" {
  subnet_id      = aws_subnet.private_subnet_az1_1.id
  network_acl_id = aws_network_acl.private_nacl_az1.id
}

resource "aws_network_acl_association" "private_subnet_az1_2_association" {
  subnet_id      = aws_subnet.private_subnet_az1_2.id
  network_acl_id = aws_network_acl.private_nacl_az1.id
}

resource "aws_network_acl_association" "private_subnet_az1_3_association" {
  subnet_id      = aws_subnet.private_subnet_az1_3.id
  network_acl_id = aws_network_acl.private_nacl_az1.id
}

# Private Subnets in AZ2
resource "aws_network_acl_association" "private_subnet_az2_1_association" {
  subnet_id      = aws_subnet.private_subnet_az2_1.id
  network_acl_id = aws_network_acl.private_nacl_az2.id
}

resource "aws_network_acl_association" "private_subnet_az2_2_association" {
  subnet_id      = aws_subnet.private_subnet_az2_2.id
  network_acl_id = aws_network_acl.private_nacl_az2.id
}

resource "aws_network_acl_association" "private_subnet_az2_3_association" {
  subnet_id      = aws_subnet.private_subnet_az2_3.id
  network_acl_id = aws_network_acl.private_nacl_az2.id
}