terraform {
  backend "s3" {
    bucket  = "learntf-state1"
    key     = "learntf-state/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}
