# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # CIDR block for your VPC
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"  # CIDR block for the subnet
  tags = {
    Name = "MySubnet"
  }
}

