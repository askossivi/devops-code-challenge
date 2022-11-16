variable "used-region" {
    type = string
    default = "us-east-2"
}

variable "vpc-cidr-block" {
    type = string
    default = "50.0.0.0/16"
}


variable "pub-subnet" {
    type = string
    default = "50.0.1.0/24"
}


variable "instance-type" {
    type = string
    description = "Used instance_type"
    default = "t2.medium"
}

variable "instance-image" {
    type = string
    description = "Instance image to be used"
    default = "ami-089a545a9ed9893b6"
}

variable "subnet-az" {
    type = string
    default = "us-east-2a"

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
