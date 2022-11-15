resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id = "${var.base-image}"
  instance_type = "${var.instance}"
  key_name = "assignment-key"

  security_groups = [ "${aws_security_group.demosg.id}" ]
  associate_public_ip_address = true
  user_data = "${file("install.sh")}"

  lifecycle {
    create_before_destroy = true
  }

  
}