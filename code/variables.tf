variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"  # Optional default region
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Optional default CIDR block
}

# Public Subnets
variable "public_subnet_cidr_az1" {
  description = "CIDR block for the public subnet in AZ1"
  type        = string
}

variable "public_subnet_cidr_az2" {
  description = "CIDR block for the public subnet in AZ2"
  type        = string
}

# Private Subnets in AZ1
variable "private_subnet_cidr_az1_1" {
  description = "CIDR block for the first private subnet in AZ1"
  type        = string
}

variable "private_subnet_cidr_az1_2" {
  description = "CIDR block for the second private subnet in AZ1"
  type        = string
}

variable "private_subnet_cidr_az1_3" {
  description = "CIDR block for the third private subnet in AZ1"
  type        = string
}

# Private Subnets in AZ2
variable "private_subnet_cidr_az2_1" {
  description = "CIDR block for the first private subnet in AZ2"
  type        = string
}

variable "private_subnet_cidr_az2_2" {
  description = "CIDR block for the second private subnet in AZ2"
  type        = string
}

variable "private_subnet_cidr_az2_3" {
  description = "CIDR block for the third private subnet in AZ2"
  type        = string
}

variable "customer_gateway_ip" {
  description = "Static IP address for the on-premises customer gateway"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1"
}