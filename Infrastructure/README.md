# List of resources 
Basic Prerequisite:
a- AWS & Terraform
b- a workstation with Terraform installed
c- An AWS access key & secret key created 
D- Generated SSH key on the Local workstation using "ssh-keygen"

# I used different file for creasting all the resouces block to facilate sysnthax troubleshooting
├───infrastructure
│   │   asg_policy.tf
│   │   asg.tf
│   │   data.sh
│   │   elb.tf
│   │   igw.tf
│   │   key-pair.tf
│   │   launch_config.tf
│   │   outputs.tf
│   │   provider.tf
│   │   README.md
│   │   route_table.tf
│   │   sg_ec2.tf
│   │   sg_elb.tf
│   │   subnets.tf
│   │   terraform.tf
│   │   vars.tf
│   │   vpc.tf
│   │
│   └───private-key
│           terraform-key
│           terraform.pub
│          
│

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