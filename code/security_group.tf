# Security Group for Public Subnets (Public Access)
resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.main.id
  depends_on = [aws_vpc.main]
  description = "Security group for public subnets across AZs"
  
  # Allow HTTP (80) and HTTPS (443) inbound from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH (22) inbound from specific IP range for admin access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your admin IP range
  }

  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PublicSecurityGroup"
  }
}

# Security Group for Private Subnets (Internal Access)
resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.main.id
  description = "Security group for private subnets across AZs"
  
  # Example: Allow internal application traffic on port 8080 (adjust as needed)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Adjust to your VPC CIDR block or internal subnets only
  }

  # Example: Allow internal database access on port 3306 (MySQL) or 5432 (PostgreSQL)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Adjust for specific internal traffic only
  }

  # Outbound rule to allow all traffic (or restrict further if needed)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PrivateSecurityGroup"
  }
}