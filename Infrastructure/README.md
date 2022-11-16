# List of resources 
Basic Prerequisite:

     a- AWS & Terraform
     b- a workstation with Terraform installed
     c- An AWS access key & secret key created 
     D- Generated SSH key on the Local workstation using "ssh-keygen"


# NOTE
Use your generated public and private key using ssh-keygen
When you run terraform apply theses resources terraform will be creating.

     an eip
     an ec2 instance
     key-pair
     network-acl
     security-group
     a vpc
     a subnet
     an igw
     a route table


# install.sh is a bash script file used to bootrap the ec2 instance. This srcipt will bootrap the instance with:

     1- run yum update 
     2- install docker
     3- start the docker engine
     4- enable the docker engine
     5- add ec2-user to group docker 
     6- Install docker-compose 
     7- yum install  git
     8- Change  /var/run/docker.sock (chmod 666)
     9 Create a docker bridge network called web-app
