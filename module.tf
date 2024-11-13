module "parameters_inclusion" {
  source             = "./code"                 
  region             = "us-east-1"             
  cidr_block         = "10.0.0.0/16"            
  customer_gateway_ip = "203.0.113.12"
}