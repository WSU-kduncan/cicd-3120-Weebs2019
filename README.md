# Part 1:

## Project Overview:

### Docker instalation:

- Use the Docker Desktop install wizard to install Docker Desktop on Windows

- Go to settings in Docker Desktop, and make sure it is set to use WSL2

- apt install Docker on WSL2

### Container building:

- To build the container run the following command

- sudo docker build -t __NAME__:__VERSION-#__ -t __NAME__:latest .

- Example of __NAME__: aboutme website

- Example of __VERSION-#__: v0.2.4 (OR) latest

### Container running:

- To run the container, you would need to execute the following command:

- docker run -dit --rm --name __APP-NAME__ -p __HOST-PORT__:__CONTAINER-PORT__ __NAME__:__VERSION-#__

- Example of __APP-Name__: running-instance1

- Example of __HOST-PORT__: 8080

- Example of __CONTAINER-PORT__: 80

- (The rest of the examples are identical to what is shown above)

### Viewing container

#### Helpful commands:

- To get public ip: curl ifconfig.me

- To get private ip: ifconfig

#### This is the first method

- To view the containers success run the following command

- curl __LOCAL-IP__:__HOST-PORT__

- Example of __LOCAL-IP__: 172.34.108.70

- Example of __HOST-PORT__: (same as previous: it must match)

#### This is another method

- To view the containers success open a web browser and enter the following

- __LOCAL-IP__:__HOST-PORT__

- (Examples the same as above)

# Part 2: 

## Project Overview:

### Create DockerHub public repo

- 1st thins first: In hub.docker.com __username__/repositories hit the "create repository" button

- Next, you need to fill in the apropriate fields

- Select "Public repo" and create

### Authenticate with DockerHub via CLI using DockerHub credentials

- Go to hub.docker.com "Account Settings / Security" and hit the "New Access Token"

- Add description

- Choose permissions desired (for this project, just 'Read' and 'Write' should be required)

- Copy the token code into a storage file

- Use the code in place of a password when using DockerHub credentials to utilize

### Configuring GitHub Secrets

- you need to first Go to github.com repository settings -> Secrets -> Actions

- next, you must create a repository secret using the "New repository secret" button

- For this project you would then, Create a secret for both DOCKER_PASSWORD (or token if used) and DOCKER_USERNAME

- Set the appropriate corresponding information as the secret body

### Behavior of GitHub workflow

- The workflow for this project builds a new image and pushes it to dockerhub on every time a push is made to main

- The variable you would need to change include 'secrets.DOCKER_USERNAME' and 'secrets.DOCKER_PASSWORD' github secrets to store username and password information

# Part 3:

## Overview:

### Container restart script

- Script performs the following:

- The container is first stopped

- It then removes the stopped container

- The script then pulls a new image from Weebs2019/firstrepo:latest 

- Finally it runs new container from image

### Webhook task definition file

- Webhook json file defines the following terms and definitions:

- id: the key to define the trigger

- execute-command: full path to the restart script

- command-working-directory: working dir

- response-message: a message displayed when the script qurried sucessfully

### Setting up a webhook on the server

- Installed and set up the following:

- docker must be set up first which is done by

-   sudo apt update

-   sudo apt install docker.io

-   now it is time for github

   -   (Set up and created keypairs to link to GitHub)

   -   git clone git@github.com:WSU-kduncan/cicd-3120-Weebs2019.git

- sudo apt install webhook

- (Set up Webhook task definition file)

- webhook -hooks webhook.json -verbose (In the webhook's directory [home/ubuntu/cicd-3120-Weebs2019/deploment/.])

### Setting up a notifier in GitHub or DockerHub

- Navigate to hub.docker.com/repositories -> __repo_name__ -> Webhooks

- Type in an id name in "Webhook name" feild and the following url in "Webhook URL"

- http://__ip_of_instance__:9000/hooks/__custom_key_name__

# Part 4:

## Diagram:

![CID-Diagram](./ceg3120-FinalProject.png)
