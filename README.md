# Overview
This repository contains a React frontend, and an Express backend that the frontend connects to.

# Objective
Deploy the frontend and backend to somewhere publicly accessible over the internet. The AWS Free Tier should be more than sufficient to run this project, but you may use any platform and tooling you'd like for your solution.

Fork this repo as a base. You may change any code in this repository to suit the infrastructure you build in this code challenge.

# Submission
1. A github repo that has been forked from this repo with all your code.
2. Modify this README file with instructions for:
* Any tools needed to deploy your infrastructure
* All the steps needed to repeat your deployment process
* URLs to the your deployed frontend.

# Evaluation
You will be evaluated on the ease to replicate your infrastructure. This is a combination of quality of the instructions, as well as any scripts to automate the overall setup process.

# Setup your environment
Install nodejs. Binaries and installers can be found on nodejs.org.
https://nodejs.org/en/download/

For macOS or Linux, Nodejs can usually be found in your preferred package manager.
https://nodejs.org/en/download/package-manager/

Depending on the Linux distribution, the Node Package Manager `npm` may need to be installed separately.

# Running the project
The backend and the frontend will need to run on separate processes. The backend should be started first.
```
cd backend
npm ci
npm start
```
The backend should response to a GET request on `localhost:8080`.

With the backend started, the frontend can be started.
```
cd frontend
npm ci
npm start
```
The frontend can be accessed at `localhost:3000`. If the frontend successfully connects to the backend, a message saying "SUCCESS" followed by a guid should be displayed on the screen.  If the connection failed, an error message will be displayed on the screen.

# Configuration
The frontend has a configuration file at `frontend/src/config.js` that defines the URL to call the backend. This URL is used on `frontend/src/App.js#12`, where the front end will make the GET call during the initial load of the page.

The backend has a configuration file at `backend/config.js` that defines the host that the frontend will be calling from. This URL is used in the `Access-Control-Allow-Origin` CORS header, read in `backend/index.js#14`

# Optional Extras
The core requirement for this challenge is to get the provided application up and running for consumption over the public internet. That being said, there are some opportunities in this code challenge to demonstrate your skill sets that are above and beyond the core requirement.

A few examples of extras for this coding challenge:
1. Dockerizing the application
2. Scripts to set up the infrastructure
3. Providing a pipeline for the application deployment
4. Running the application in a serverless environment

This is not an exhaustive list of extra features that could be added to this code challenge. At the end of the day, this section is for you to demonstrate any skills you want to show that’s not captured in the core requirement.



# SUBMISSION README.md file

# Step 1: IaC Deployment

#  Basic Prerequisite:
- AWS free tier account
- A workstation with Terraform installed
- An AWS access key & secret key created 
- SSH private and public key generated using "ssh-keygen"
- A workstation with docker installed

1- To start, you will need to have an aws account. It is free to create one. Follow this link below to create one:

   - https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/

2- Install AWS CLI and Terraform on your local machine using the link below:

   - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
   - https://developer.hashicorp.com/terraform/downloads

3- Generate and configure your AWS user profile credential:

   - https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

4- Install docker on your local workstation - Windows:

   - https://docs.docker.com/desktop/install/windows-install/

for mac install use this link below:

   - https://docs.docker.com/desktop/install/mac-install/


# Github repo that has been forked from the repo with all my codes. 
    https://github.com/askossivi/devops-code-challenge

# Infrastructure as Code (IaC) with Terraform

 There are two folders (State-backen/ and Infrastructure/) that contain the terraform synthax needed for this deployment

# Creating the State Locking resources from the folder "State-backend/"
This folder contains terraform synthax when run will create:

    1- an s3 bucket, 
    2- a DynamoDB table for state locking # used in the Infrastructure folder ('./infrastructure/terraform.tf#10 - #15') to maintain the terraform.tfstate file concistency, 
    3- KMS alias used for the s3  bucket server side encryption_configuration.

To deploy this, run:

    cd State-backend/
    terraform init
    terraform validate
    terraform plan
    terraform apply --auto-approve


# Deploying the infrastruction from the folder "infrastruction/"
Rinning this IaC systhax will deploy 17 resources in AWS including a free tier ec2 instance, an elb, etc...
The README.md, ('./infrastruction/README.md') contains a list of resources deployed.

    cd infrastruction
    cat README.md
    terraform init
    terraform validate
    terraform plan
    terraform apply --auto-approve


# Step 2: Dokerize both backend and frontend
# Configuration
Update both frontend and backend "API_URL" AND "CORS_ORIGIN" in their respective configuration file, (`frontend/src/config.js`, `backend/config.js` ) with the host IP address or the load balancer IP address o


# Dockerize Backend
To dockerize the backend, create a Dockerfile with all the required layers starting starting nodejs base image.


    cd backend
    vi Dockerfile

    FROM node:12.18.3   #base image
    WORKDIR /app
    COPY ["package.json", "package-lock.json", "./"]
    RUN npm install --production
    COPY . .
    EXPOSE 8080
    CMD ["node", "index.js"]

Build and push the docker image tagged "devtraining/server-backend:v1.0.0" into a public docker hub registry called devtraining

    docker build -t devtraining/server-backend:v1.0.0 .
    docker push devtraining/server-backend:v1.0.0


# Dockerize Frontend
 To dockerize the frontend, create a Dockerfile with all the required layers starting with nodejs base image. 

    cd frontend
    vi Dockerfile:

    FROM node:12.18.3   #base image
    WORKDIR /app
    COPY ["package.json", "package-lock.json", "./"]
    RUN npm install --production
    RUN npx browserslist@latest --update-db
    COPY . .
    EXPOSE 3000
    CMD ["npm", "start"]


Build and pushed the docker image tagged "devtraining/client-frontend:v1.0.0" into a public docker hub registry called devtraining

    docker build -t devtraining/client-frontend:v1.0.0 .
    docker push devtraining/client-frontend:v1.0.0


# Deploy the containers
Connect to the deployed EC2 Instance:
Login to AWS console and copy and paste the ssh-client login credentials

    $ ssh -i "YOUR KEY PAIR" ec2-user@EC2-IP-ADDRESS        # From your local workstation terminal
    $ docker ps -a    # Verify any running or created or exited container
    $ docker images   # Verify if any docker images exit already locally 

    # Create the docker container by running below command map with the bridge network 'web-app' created during the IaC deployment

    $ docker run --name=backend-container -p 8080:8080 --network web-app -d devtraining/server-backend:v1.0.0
    $ docker run --name=frontend-container -p 3000:3000 --network web-app -d devtraining/client-frontend:v1.0.0


# Create a DNS Record - This step will required a domain hosted in AWS (Not free)
Map the load balancer to a domain or subdomain of your choice. Use below link for documentation

- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-elb-load-balancer.html

# Verify the deployed app

Copy and paste the url in the browser: 

1- Frontend:
- http://assignment.kossiviautomation.net:3000/  
- curl -i http://assignment.kossiviautomation.net:3000/

2- Backend:
- http://assignment.kossiviautomation.net:8080/
- curl -i http://assignment.kossiviautomation.net:8080/




