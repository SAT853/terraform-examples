resource "aws_instance" "web_server" {
  # ami = "ami-4ae27e22"
  ami           = lookup(var.webserver_amis, var.aws_region)
  instance_type = "t2.micro"
  subnet_id = "${aws_default_subnet.learntf_default_subnet.id}"

  depends_on = ["aws_s3_bucket.learntf-bins"]
}


output "web_server_public_ip" {
  value = "${aws_instance.web_server.public_ip}"
}
