#! /bin/bash
sudo yum update -y
sudo yum -y install docker 
sudo systemctl start docker 
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo yum install -y git
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose
sudo chmod 666 /var/run/docker.sock
#Network
docker network create web-app