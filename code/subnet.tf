# Get the list of availability zones
data "aws_availability_zones" "available" {}

# Create Public Subnets dynamically across the specified Availability Zones
resource "aws_subnet" "public_subnet" {
  count             = var.num_availability_zones # This will create subnets based on the number of AZs
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(
    [
      var.public_subnet_cidr_az1,
      var.public_subnet_cidr_az2,
      var.public_subnet_cidr_az3
    ],
    count.index
  )
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-AZ${count.index + 1}"
  }
}

# Create Private Subnets dynamically across the specified Availability Zones
resource "aws_subnet" "private_subnet" {
  count             = var.num_availability_zones * 3 # 3 private subnets per AZ
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(
    [
      var.private_subnet_cidr_az1_1,
      var.private_subnet_cidr_az1_2,
      var.private_subnet_cidr_az1_3,
      var.private_subnet_cidr_az2_1,
      var.private_subnet_cidr_az2_2,
      var.private_subnet_cidr_az2_3,
      var.private_subnet_cidr_az3_1,
      var.private_subnet_cidr_az3_2,
      var.private_subnet_cidr_az3_3
    ],
    count.index
  )
  availability_zone = data.aws_availability_zones.available.names[count.index % var.num_availability_zones] # Loops through AZs

  tags = {
    Name = "PrivateSubnet-${count.index + 1}-AZ${count.index % var.num_availability_zones + 1}"
  }
}