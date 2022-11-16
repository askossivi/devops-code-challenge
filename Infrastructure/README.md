# List of resources 
Basic Prerequisite:
a- AWS & Terraform
b- a workstation with Terraform installed
c- An AWS access key & secret key created 
D- Generated SSH key on the Local workstation using "ssh-keygen"


# NOTE
Use your generated public and private key using ssh-keygen
After terraform apply completes terraform will create theses resources.

1- VPC
2- Auto Scaling Group
3- Launch Configurationn
4- Auto Scaling Policy
5- Load Balancer
6- Internet Gateway
7- Route Table
8- Security Groups
9- Subnets (subnet)
10- Cloud Watch Alarm
11- EC2 Instance


install.sh is a bash script file used to bootrap the ec2 instance. This srcipt will bootrap the instance with:

1- run yum update 
2- install docker
3- start the docker engine
4- enable the docker engine
5- add ec2-user to group docker 
6- Install docker-compose 
7- yum install  git
8- Change  /var/run/docker.sock (chmod 666)
9 Create a docker bridge network called web-app
