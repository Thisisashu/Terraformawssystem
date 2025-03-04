data "terraform_remote_state" "network_details" {
backend = "s3"
config = {
bucket = "ashutosh-terraform19-bucket"
key = "terraform.19-network-state"
region = "us-east-1"
}
}

