resource "aws_security_group" "Web-Sec-grp" {
    #name = "allow-traffic"
    description = "Allow http, ssh traffic"
    vpc_id = aws_vpc.asg-vpc.id
    ingress {
        description      = "allow 443"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        #name            = "allow ssh"
        description      = "allow 22"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
       # name            = "allow http"
        description      = "allow 80"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
       cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        #name            = "allow ssh"
        description      = "allow 9001"
        from_port        = 3000
        to_port          = 3000
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }


    ingress {
        #name            = "allow ssh"
        description      = "allow 81"
        from_port        = 8080
        to_port          = 8080
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        #name            = "allow all"
        description = "allow all traffic out"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        # ipv6_cidr_blocks = ["::/0"]
     }

  tags = {
    Name = "Web-Sec-grp"
  }
}