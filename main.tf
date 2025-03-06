resource "aws_instance" "my_vm"  { 
count  = 2
ami = data.aws_ami.latest_amazon_linux.id
instance_type = var.instance_type 
subnet_id = data.terraform_remote_state.network_details.outputs.subnet_id 
key_name = data.terraform_remote_state.network_details.outputs.aws_key_pair
depends_on = [data.terraform_remote_state.network_details]
security_groups = [
    data.terraform_remote_state.network_details.outputs.security_group_id  # Security Group ID from remote state
  ]
lifecycle {
    ignore_changes = [security_groups] #Ignore security group changes
  #    create_before_destroy = true
    prevent_destroy       = true

  }
 
 
tags = {
  Name = "student.19-vm${count.index + 1}"
}
  
}
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.my_vm[*].public_ip
}

output "instance_type" {
 value = aws_instance.my_vm[*].instance_type
}

