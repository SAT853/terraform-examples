resource "aws_instance" "web_server" {
  instance_type = "t2.micro"
  ami           = "ami-0c2b8ca1dad447f8a"
}