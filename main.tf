resource "aws_instance" "my_vm"  { 
ami = "ami-05b10e08d247fb927" 
instance_type = "t2.micro" 
subnet_id = data.terraform_remote_state.network_details.outputs.subnet_id 
key_name = data.terraform_remote_state.network_details.outputs.aws_key_pair
security_groups = [
    data.terraform_remote_state.network_details.outputs.security_group_id  # Security Group ID from remote state
  ] 
tags = { 
Name = "My-vm" 
} 
}
