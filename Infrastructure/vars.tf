# Defining Region
variable "deployment-region" {
  default = "us-east-2"
}


# Defining Public Key
variable "public_key" {
  default = "private-key/terraform.pub"
}

# Defining Private Key
variable "private_key" {
  default = "private-key/terraform-key"
}

# Definign Key Name for connection
variable "key_name" {
  default = "assignment-key"
  description = "Name of AWS key pair"
}

# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "20.0.0.0/16"
}

# Defining CIDR Block for Subnet
variable "subnet_cidr" {
  default = "20.0.1.0/24"
}

# Defining CIDR Block for 2d Subnet
variable "subnet1_cidr" {
  default = "20.0.2.0/24"
}


# Defining Base AMI
variable "base-image" {
  default = "ami-089a545a9ed9893b6"
}


# Defining Instance Type
variable "instance" {
  default = "t2.micro"
}