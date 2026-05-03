terraform {
  backend "s3" {
    bucket         = "nagham-terraform-labs"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
#    dynamodb_table = "terraform-locks"
  }
}