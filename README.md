# demo-iac (Infrastructure as Code for WordPress Deployment)![alt text](terraform/image/wordprss.png)


This project demonstrates Infrastructure as Code (IaC) using tools like Terraform and Ansible to provision and manage cloud resources.

## Features

- Provision cloud infrastructure using Terraform
- Configure and manage servers using Ansible
- Automated deployment and scaling of resources

## Usage

1. Clone the repository.
2. Navigate to the `terraform` directory and initialize Terraform.
3. Apply the Terraform configuration to provision the infrastructure.
4. Navigate to the `ansible` directory and run the playbooks to configure the servers.

## Requirements

- Terraform 1.0.0+
- Ansible 2.9+
- Python 3.8+
- `boto3` library for AWS integration

## Installation

1. Clone the repository.
2. Install the required dependencies using `pip install -r requirements.txt`.

## Terraform

- Navigate to the `terraform` directory.
- Initialize Terraform: `terraform init`
- Apply the configuration: `terraform apply`

## Ansible

- Navigate to the `ansible` directory.
- Run the playbooks: `ansible-playbook -i inventory site.yml`
