# Create a VPC
resource "aws_vpc" "asg-vpc" {
  cidr_block = var.vpc-cidr-block
  tags = {
    "Name" = "web-server-vpc"
  }
}

resource "aws_subnet" "pub-web-subnet" {
  vpc_id     = aws_vpc.asg-vpc.id
  cidr_block = var.pub-subnet
  availability_zone = var.subnet-az

  tags = {
    Name = "Pub-Web-net"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.asg-vpc.id
    tags = {
      "Name" = "Web-IGW"
    }
}


resource "aws_route_table" "web-rt" {
    vpc_id = aws_vpc.asg-vpc.id
    tags = {
      "Name" = "Web-rt"
    }
}


resource "aws_route" "Web-route" {
    route_table_id = aws_route_table.web-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id 
}


resource "aws_route_table_association" "Web-rta" {
    subnet_id = aws_subnet.pub-web-subnet.id
    route_table_id = aws_route_table.web-rt.id
}


resource "aws_network_interface" "Web-Interface" {
    subnet_id = aws_subnet.pub-web-subnet.id
    security_groups = [aws_security_group.Web-Sec-grp.id]
    tags = {
      "Name" = "Primary-Net-Interface"
    
    }
}
