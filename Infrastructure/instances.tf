# Instance Block
resource "aws_instance" "Web-instance" {
    ami = var.instance-image
    instance_type = var.instance-type
    #availability_zone = "us-east-2c"
    associate_public_ip_address = true
    key_name = "assignment-key"
    tags = {
      "Name" = "Web-Instance"
    }
    subnet_id = aws_subnet.pub-web-subnet.id
    vpc_security_group_ids = [aws_security_group.Web-Sec-grp.id]
    user_data = file("apache-install.sh")
    root_block_device {
        delete_on_termination = true
        volume_size = 20
        tags = {
            "Name" = "Web-root-vol"
        } 
    }

    
}

