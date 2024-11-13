
data "aws_availability_zones" "available" {}

# Create Subnets across two Availability Zones

# Public Subnet in AZ1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_az1
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-AZ1"
  }
}

# Public Subnet in AZ2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_az2
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-AZ2"
  }
}

# Private Subnets in AZ1 and AZ2

# Private Subnet 1 in AZ1
resource "aws_subnet" "private_subnet_az1_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_az1_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "PrivateSubnet-1-AZ1"
  }
}

# Private Subnet 2 in AZ1
resource "aws_subnet" "private_subnet_az1_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_az1_2
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "PrivateSubnet-2-AZ1"
  }
}

# Private Subnet 3 in AZ1
resource "aws_subnet" "private_subnet_az1_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_az1_3
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "PrivateSubnet-3-AZ1"
  }
}

# Private Subnet 1 in AZ2
resource "aws_subnet" "private_subnet_az2_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_az2_1
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PrivateSubnet-1-AZ2"
  }
}

# Private Subnet 2 in AZ2
resource "aws_subnet" "private_subnet_az2_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_az2_2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PrivateSubnet-2-AZ2"
  }
}

# Private Subnet 3 in AZ2
resource "aws_subnet" "private_subnet_az2_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_az2_3
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PrivateSubnet-3-AZ2"
  }
}