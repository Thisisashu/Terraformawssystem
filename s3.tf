resource "aws_s3_bucket" "my_bucket" {
bucket = "ashutosh-terraform19-bucket"
acl = "private"
force_destroy = "true"
}

