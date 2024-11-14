module "parameters_inclusion" {
  source             = "./code"                 
  region                       = "us-west-2"    # Specify the region
  cidr_block                   = "10.0.0.0/16"  # Main VPC CIDR block
  num_availability_zones       = "2"            # Specify the required number
  public_subnet_cidr_az1       = "10.0.1.0/24"  # CIDR for Public Subnet AZ1
  public_subnet_cidr_az2       = "10.0.2.0/24"  # CIDR for Public Subnet AZ2
  public_subnet_cidr_az3       = "10.0.12.0/24"  # CIDR for Public Subnet AZ3
  private_subnet_cidr_az1_1    = "10.0.3.0/24"  # CIDR for Private Subnet 1 in AZ1
  private_subnet_cidr_az1_2    = "10.0.4.0/24"  # CIDR for Private Subnet 2 in AZ1
  private_subnet_cidr_az1_3    = "10.0.5.0/24"  # CIDR for Private Subnet 3 in AZ1
  private_subnet_cidr_az2_1    = "10.0.6.0/24"  # CIDR for Private Subnet 1 in AZ2
  private_subnet_cidr_az2_2    = "10.0.7.0/24"  # CIDR for Private Subnet 2 in AZ2
  private_subnet_cidr_az2_3    = "10.0.8.0/24"  # CIDR for Private Subnet 3 in AZ2
  private_subnet_cidr_az3_1    = "10.0.9.0/24"  # CIDR for Private Subnet 1 in AZ3
  private_subnet_cidr_az3_2    = "10.0.10.0/24"  # CIDR for Private Subnet 2 in AZ3
  private_subnet_cidr_az3_3    = "10.0.11.0/24"  # CIDR for Private Subnet 3 in AZ3
  customer_gateway_ip          = "203.0.113.12"  # Customer Gateway IP
}