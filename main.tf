resource "aws_instance" "my_vm"  { 
ami = "ami-05b10e08d247fb927" 
instance_type = var.instance_type 
subnet_id = data.terraform_remote_state.network_details.outputs.subnet_id 
key_name = data.terraform_remote_state.network_details.outputs.aws_key_pair
security_groups = [
    data.terraform_remote_state.network_details.outputs.security_group_id  # Security Group ID from remote state
  ] 
 
tags = {
  Name = format("MyInstance-%s", formatdate("YYYYMMDD", timestamp()))
}
  
}
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.my_vm.public_ip
}

output "instance_type" {
 value = aws_instance.my_vm.instance_type
}

