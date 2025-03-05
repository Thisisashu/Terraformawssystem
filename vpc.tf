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
  map_public_ip_on_launch = "true"
  tags = {
    Name = "MySubnet"
  }
}
resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.main.id
tags = {
Name = "ashu-igw"
}
} 
resource "aws_route_table" "my-route-table" {
vpc_id = aws_vpc.main.id
#Route anything with a CIDR of 0.0.0.0/0 to the IGW
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
}
resource "aws_route_table_association" "my-route-association" { 
subnet_id = aws_subnet.subnet1.id 
route_table_id = aws_route_table.my-route-table.id 
} 




