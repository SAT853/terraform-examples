resource "aws_key_pair" "deployer-keypair" {
  key_name   = "boostrap-key"
  public_key = file("/home/osboxes/Desktop/terraform/rsa-key/aws-rsa.pub")
}



