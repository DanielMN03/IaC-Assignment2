### IaC - Compulsory assignment 2 solution

## Assignment requirements
Your company, OperaTerra, is launching a new e-commerce platform. As a DevOps engineer, you're tasked with setting up the infrastructure on Microsoft Azure using Terraform. The platform requires a web application, a database for product information and user data, and a storage solution for product images.
Requirements
The infrastructure components you need to set up include a Virtual Network with proper subnets, an Azure Service Plan for hosting the web application, an SQL Database for storing product and user data, Azure Blob Storage for storing product images, and an Load Balancer in front of the web application.
You are required to implement this infrastructure for three environments: Development (dev), Staging, and Production (prod).
Your Terraform implementation should define and deploy all infrastructure components. You should create modules for reusable components such as networking, app service, database, and storage. Use locals for environment-specific customization and implement random name generation for globally unique resource names. Ensure that you pass information between root module and child modules effectively. Additionally, use remote state storage with Azure Storage Account.
The main focus for this assignment is to implement a CI/CD pipeline using GitHub Actions or simular available tools (Digger etc.).
For infrastructure configuration it should be created branches (remember good naming convention and life cycle) that should undergo code reviews (terraform fmt, terraform validate and tflint/tfsec) before they are merged into the environment branches (e.g., dev, staging, prod), which providing a layer of quality assurance.
Create Pull Request to perform merging with environment branches.
Merging with environment branches should trigger a workflow that will plan and apply infrastructure to workspaces except prod
For deoployment of infrastructure in prod it must be aproved by a minimum of one person.
 
An important part of this assignment is to analyze and discuss the three provided folder structure alternatives. You should choose one and justify your decision based on scalability, maintainability, separation of concerns, and ease of implementing CI/CD.


## Folders and structure
My solution includes the second structure of the three options we were given. The fodlers include a root folder, with folders deployments, global and modules. The structure also contains a github folder which naturally contains the worflow yaml files.

# Deployments
Depolyments is the folder which holds the provider blocks and the backend and is the folder where commands are run from. To use this infrastructure navigate to the deployments folder and run terraform init. To run a plan of the current infrastructure run:
terraform plan -var-file-"terraform.tfvars.current-branch" -out=main.tfplan or save it to any file name you want. Thereafter, the resources can be applied using terraform apply "main.tfplan". This is how you can do it locally without the CI/CD pipeline.

The deployments folder also contains the necessary three tfvars files for each environment dev staging and prod, with appropriate names.

# modules
The modules folder contains subfolders for each component; app_service, database, networking and storage.

# app_service
The appservice folder creates the service plan which holds the infrastrcuture for the potetial webapplication. There was not developed one since this wasnt a required part for the assignment.

# Database
The database module creates the necessaery sql server and database required by the assignment, aswell as a security alert policy since this was a high priority problem flagged by tfsec. The security alert policy is connect to the storage though the storage account access key output. The database/outputs.tf includes neceassrey outputs in other parts of the infrastructure.

# Networking
The networking module creates the necessayr vnet, subnets, network security group and nsg associations. It also creates the load balancer and the necessary frontend ip config

# Storage
The storage module creates the sortage accoutn adn blob conatiner necessary for this project.

# Pipeline workflow
