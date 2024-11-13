variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"  # Optional default region
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/17"  # Optional default CIDR block
}

variable "customer_gateway_ip" {
  description = "Static IP address for the on-premises customer gateway"
  type        = string
  default     = "203.0.113.12"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     ="us-east-1"
}