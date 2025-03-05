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
output "aws_key_pair" {
  value = aws_key_pair.vm_ssh_key.key_name
}
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.allow_tls_and_ssh.id
}

# Optional: You can also output the security group name, CIDR block, and other attributes
output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.allow_tls_and_ssh.name
}

output "security_group_cidr_blocks" {
  description = "The CIDR blocks allowed for ingress"
  value       = aws_security_group.allow_tls_and_ssh.ingress
}
