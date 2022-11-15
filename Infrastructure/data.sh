#! /bin/bash
sudo yum update -y
sudo yum update -y
sudo yum install -y docker
sudo yum -y install docker 
sudo systemctl start docker 
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose
sudo chown ec2-user:ec2-user /home/ec2-user/docker-compose.yml
sudo yum install -y git
sudo chmod 666 /var/run/docker.sock
#Network
docker network create web-app
#Backend:
docker pull devtraining/server-backend:v1.0.0
docker run --name=backend-container -p 8080:8080 --network web-app -d devtraining/server-backend:v1.0.0
#Frontend:
docker pull devtraining/client-frontend:v1.0.0
docker run --name=frontend-container -p 3000:3000 --network web-app -d devtraining/client-frontend:v1.0.0
 




