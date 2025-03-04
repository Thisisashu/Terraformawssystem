resource "aws_key_pair" "vm_ssh_key" {
key_name = "ashu-key"
public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRkStAyvysUbA02Y2xI4scJJlg9TJe5aTB49rNa+OfW root@user1"
}

