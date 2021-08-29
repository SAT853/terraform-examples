resource "aws_instance" "web_server" {

  ami           = lookup(var.webserver_amis, var.aws_region)
  instance_type = "t2.micro"

  # subnet_id = "${aws_default_subnet.learntf_default_subnet.id}"

  key_name = aws_key_pair.deployer-keypair.key_name

  vpc_security_group_ids = ["${aws_security_group.web_server_sec_group.id}"]

  # depends_on = ["aws_s3_bucket.learntf-bins"]

  # Provisioner
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum install -y httpd",
  #     "sudo service httpd start",
  #     "sudo groupadd www",
  #     "sudo usermod -a -G www ubuntu",
  #     "sudo usermod -a -G www apache",
  #     "sudo chown -R apache:www /var/www",
  #     "sudo chmod 770 -R /var/www"
  #   ]
  # }


  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ubuntu"
  #   private_key = file("/home/osboxes/Desktop/terraform/rsa-key/aws-rsa")
  # }


}


output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "web_server_public_dns" {
  value = aws_instance.web_server.public_dns
}

