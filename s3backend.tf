terraform {
  backend "s3" {
    bucket = "ashutosh-terraform19-bucket"
    key    = "terraform.19-network-state"
    region = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

