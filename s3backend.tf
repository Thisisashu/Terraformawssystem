terraform {
  backend "s3" {
    bucket = "ashutosh-terraform19-bucket"
    key    = "terraform.19-instance-state"
    region = "us-east-1"
  }
}


