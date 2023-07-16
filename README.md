# Springboot-crud-sample
This is a sample Dockerized Springboot CRUD app that uses MySQL  
You can do local development for the SpringBoot application just with `docker-compose` without setting up a local database  
MySQL's Docker image will be used.

You can also deploy the app remotely to AWS following the instructions below.

## Local development using docker (Serves MySQL on docker)  
Start up docker on your PC
`docker-compose build`
`docker-compose up`

`docker-compose.yaml` builds the Docker image with `local.Dockerfile`, which starts the jar using Spring profile=docker,
thus using the properties in `application-docker.properties`

Can enter the mysql container with docker exec 

## Serving the app on AWS (Not finished, TBC) 
1. Create a MySQL RDS instance in your AWS account. Create credentials and memorize them. (For demo purposes, set credentials as admin/password) Set "Publicly Accessible" - yes.  
   If you will be using an EC2 to serve the app, you can in the settings setup the connection between the EC2 instance and your new database.
   Connect to the instance, and create a database, and the tables needed. 
   
2. Push the Docker image of this Springboot app onto ECR, by following the instructions on https://github.com/jonkenobi/springboot-docker-demo/blob/master/README.md 
   In the Codebuild project, add the `db_url` environment variable based on the endpoint of the DB instance created in step 1.  
3. Deploy the Docker image. 
 

## TODO 
Complete Step1 
Make a new RDS instance. Try to make it public so you can connect to it from your local.. 
So far have not succeeded in making it public, probably because my RDS instances are always created in a private subnet
Connect to the DB thru workbench or EC2 Connect, and create database and tables needed in the rds instance. Checkin that sql code.  
Then connect local Springboot to the RDS
Inject the DB endpoint into the dockerfile 
Deploy image to remote  
