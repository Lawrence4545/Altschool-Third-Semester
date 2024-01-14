Using Terrafrom create an aws instance (ubuntu) in multiple regions (free-tier) (eu-west-1 and eu-central-1)

# should be on minimum of 2 availablity zones

# should be reuseable

# can be built on multiple environments (dev, prod)

# should have a script that creates ansible, docker container

# your scripts should be modularized

# Create a VPC for the various environments

################SOLUTION#########################
# AWS Multi-Region Deployment with Terraform

This project automates the deployment of an Ubuntu EC2 instance in multiple AWS regions 
(eu-west-1 and eu-central-1) across a minimum of 2 availability zones.
The infrastructure is designed to be reusable and can be deployed in different environments (dev, prod).

## Prerequisites

Before you begin, ensure you have the following prerequisites installed and configured:

- [Terraform](https://www.terraform.io/) (version x.x.x)
- [AWS CLI](https://aws.amazon.com/cli/) configured with the necessary permissions
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/) 

## Directory Structure

```plaintext
project-root/
│
├── Frankfurt-region/
│   ├── ec2_instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── region-2.tfvars
│   └─ modules/
│     ── vpc/
│       ├── main.tf
│       ├── variables.tf
│       └── instance.tf
        ├── outputs.tf
        ├── SG.tf

  ├── Ireland-region/
  │   ├── ec2_instance/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   └── region-1.tfvars
  │   └─ modules/
  │     ── vpc/
  │       ├── main.tf
  │       ├── variables.tf
  │       └── instance.tf
          ├── outputs.tf
          ├── SG.tf

# Terraform Configuration: ec2_instance
This Terraform configuration file, named `ec2_instance`, is responsible for defining and
deploying an EC2 instance within the AWS infrastructure.
The configuration leverages Terraform modules for creating a VPC (`vpc`) and subsequently
deploys an EC2 instance within that VPC.

# Terraform Variable File: region.tfvars
The `region.tfvars` file, located in the `ec2_instance` folder
contains specific variable values used by the Terraform configuration (`ec2_instance.tf`).
These variables customize the deployment of the EC2 instance and associated resources.



