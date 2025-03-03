output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.subnet1.id
}

output "subnet_cidr_block" {
  description = "The CIDR block of the subnet"
  value       = aws_subnet.subnet1.cidr_block
}

output "subnet_availability_zone" {
  description = "The Availability Zone of the subnet"
  value       = aws_subnet.subnet1.availability_zone
}

output "subnet_vpc_id" {
  description = "The VPC ID to which the subnet belongs"
  value       = aws_subnet.subnet1.vpc_id
}

output  "aws_internet_gateway" {
description = "internet gateway id"
value = aws_internet_gateway.igw.id
}

