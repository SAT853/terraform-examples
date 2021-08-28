resource "aws_instance" "web_server" {
  # ami = "ami-4ae27e22"
  ami           = lookup(var.webserver_amis, var.aws_region)
  instance_type = "t2.micro"
}


output "web_server_public_ip" {
  value = "${aws_instance.web_server.public_ip}"
}

# Managing Multiple Instances
resource "aws_instance" "test_server" {
  # ami = "ami-4ae27e22"
  ami           = lookup(var.webserver_amis, var.aws_region)
  instance_type = "t2.micro"
  count = "${var.target_env == "dev" ? 0 : 1}"
}

# Managing Multiple Instances
output "test_server_ips" {
  value = "${aws_instance.test_server.*.private_ip}"
}

# Selecting Single Server
# output "test_server_ip" {
#   value = "${aws_instance.test_server.*.private_ip[0]}"
# }


data "template_file" "webserver_policy_template" {

  template = "${file("${path.module}/policy.tpl")}"

  vars = {
    arn = "${aws_instance.web_server.arn}"
  }
}


output "web_server_policy_outpu" {
  value = "${data.template_file.webserver_policy_template.rendered}"
}