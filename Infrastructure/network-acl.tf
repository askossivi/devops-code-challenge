resource "aws_network_acl" "Web-net-acl" {
    vpc_id = aws_vpc.asg-vpc.id
    subnet_ids = [aws_subnet.pub-web-subnet.id]
    ingress {
      action = "allow"
      cidr_block = "0.0.0.0/0"
      from_port = 0
      protocol = "-1"
      rule_no = 99
      to_port = 0
    } 
    egress {
      action = "allow"
      cidr_block = "0.0.0.0/0"
      from_port = 0
      protocol = "-1"
      rule_no = 99
      to_port = 0
    } 
    tags = {
        "Name" = "Web-Server-Net-ACL"
    }
}