######## Project Question ###########
# Using Terrafrom create an aws instance (ubuntu) in multiple regions (free-tier) (eu-west-1 and eu-central-1)

# should be on minimum of 2 availablity zones

# should be reuseable

# can be built on multiple environments (dev, prod)

# should have a script that creates ansible, docker container

# your scripts should be modularized

# Create a VPC for the various environments
##########################################

############SOLUTION###################

# AWS Multi-Region Deployment with Terraform

This project automates the deployment of an Ubuntu EC2 instance in multiple AWS regions (eu-west-1 and eu-central-1) across a minimum of 2 availability zones. The infrastructure is designed to be reusable and can be deployed in different environments (dev, prod).

## Prerequisites

Before you begin, ensure you have the following prerequisites installed and configured:

- [Terraform](https://www.terraform.io/) (version 5.0)
- [AWS CLI](https://aws.amazon.com/cli/) configured with the necessary permissions
- [Docker](https://www.docker.com/) 

## Directory Structure

```plaintext
project-root/
│
├── Frankfurt Region/
│   ├── ec2_instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── region-2.tfvars
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── instance.tf
│
│   │   ├── outputs.tf
│   │   ├── SG.tf

│
├── Ireland Region/
│   ├── ec2_instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── region-1.tfvars
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── instance.tf
│
│   │   ├── outputs.tf
│   │   ├── SG.tf

###################################

##### Terraform Configuration: main.tf ########

# This Terraform configuration file, named `main.tf`, is responsible for defining and deploying an EC2 instance within the AWS infrastructure.
# The configuration leverages Terraform modules for creating a VPC (`vpc`) and subsequently deploys an EC2 instance within that VPC.

# Components
# Terraform Block: Specifies the required Terraform providers, in this case, the AWS provider with a specified version.

# AWS Provider Block: Configures the AWS provider with the specified region obtained from the var.region variable.

# VPC Module: Utilizes the custom Terraform module located at ../modules/vpc to create a Virtual Private Cloud (VPC)
# along with its associated resources.
# This includes project-specific variables such as project_name,
# vpc_cidr, public_subnet_az1_cidr, and public_subnet_az2_cidr.

## Variables
# region: AWS region where the resources will be deployed.
# project_name: A name to identify the project.
# vpc_cidr: CIDR block for the VPC.
# public_subnet_az1_cidr: CIDR block for the public subnet in Availability Zone 1.
# public_subnet_az2_cidr: CIDR block for the public subnet in Availability Zone 2.
# ami: AMI (Amazon Machine Image) ID for the EC2 instance.
# type: EC2 instance type.
# key_pair: Key pair for SSH access to the EC2 instance.
##########################################

# Terraform Variable File: region.tfvars

# The `region.tfvars` file, located in the `ec2_instance` folder,
# Which contains specific variable values used by the Terraform configuration (`main.tf`).
# These variables customize the deployment of the EC2 instance and associated resources.
#####################################

# Terraform Variable Definitions: variables.tf

# The `variables.tf` file, located in the `ec2_instance` folder, defines the Terraform variables
# used within the Terraform configuration (`ec2_instance.tf`).
# These variables provide flexibility and allow users to customize key aspects of the infrastructure deployment.
###########################################

# Terraform Module: vpc/instance.tf

# The `instance.tf` file, located in the `modules/vpc` folder, defines the Terraform resource for creating
# an AWS EC2 instance within the Virtual Private Cloud (VPC).
# This resource leverages the specified variables to configure the EC2 instance and includes user data for custom initialization.
###############################################

# Terraform Module: vpc/main.tf

The `main.tf` file, located in the `modules/vpc` folder, defines the Terraform resources
for creating a Virtual Private Cloud (VPC) along with associated resources
such as internet gateway, subnets, and route tables.
##############################################

# Terraform Module: vpc/output.tf
The `output.tf` file, located in the `modules/vpc` folder, defines Terraform outputs for
providing information about the deployed resources.
These outputs allow users to retrieve specific values after the infrastructure is provisioned.
#######################################

# Terraform Module: vpc/sg.tf

The `sg.tf` file, located in the `modules/vpc` folder, defines a Terraform resource for creating
an AWS Security Group. This Security Group is designed to control inbound and outbound traffic
for public instances within the Virtual Private Cloud (VPC).
############################################

# Terraform Module: vpc/variables.tf

The `variables.tf` file, located in the `modules/vpc` folder, defines the Terraform variables
used within the VPC module. These variables provide flexibility and allow users to customize
key aspects of the Virtual Private Cloud (VPC) configuration.

#####To run the terraform project##
# terraform init 
# terraform plan
# terraform validate
# terrafrom fmt 
# terrafrom apply


