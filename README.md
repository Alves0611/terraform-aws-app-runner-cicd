# DevOps Deployment Project

## Description

This project aims to demonstrate the configuration and deployment of an application following DevOps best practices. We use containers to ensure application portability, Terraform for infrastructure as code provisioning, GitHub Actions for CI/CD pipeline automation, and AWS for hosting and cloud services.

## Project Overview

![](./image/rocketseat.drawio%20.svg)


## Project Structure

- **Dockerfile**: Used to build the application image.
- **Terraform**: Used to provision resources on AWS, including the ECR repository and necessary IAM roles.
- **GitHub Actions**: Used to automate the build, test, and deployment of the application.


## CI/CD Pipeline Overview

This project includes a CI/CD pipeline configured using GitHub Actions. The pipeline is designed to automatically build and deploy the application whenever changes are pushed to the `main` branch.

### How the Pipeline Works

1. **Triggering the Pipeline**: The pipeline is triggered automatically whenever a commit is pushed to the `main` branch of the repository.

2. **Building the Application**: Once triggered, the pipeline pulls the latest code from the repository and builds a Docker image of the application. This image is then pushed to an Amazon Elastic Container Registry (ECR) repository.

3. **Deploying the Application**: After the Docker image is successfully built and stored in ECR, the pipeline proceeds to deploy the application to AWS App Runner. The App Runner service will use the latest Docker image from ECR to run the application.


## How can I use?

### 1. Clone the Repository First, clone the repository to your local machine: 

```bash git clone https://github.com/Alves0611/terraform-aws-app-runner-cicd```


#### Prerequisites

Before proceeding, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS CLI configured with the necessary credentials and permissions.
- An S3 bucket and a DynamoDB table already created, or the Terraform configuration in this step will create them.

#### Steps to Set Up Remote State

1. Navigate to the Remote State Configuration Directory

Move to the directory where the Terraform configuration for setting up the remote state is located:

```
cd terraform-aws-app-runner-cicd
terraform init
```

Review the Terraform Plan

```
terraform plan
```

Apply the Terraform Configuration

```
terraform apply -auto-approve
```

### Application Deployment Resources Setup

#### Introduction

This guide provides instructions for creating the infrastructure resources necessary for deploying the application. We will use Terraform to provision resources on AWS, such as ECR repositories, IAM roles, and other related services.

#### Prerequisites

Before you begin, make sure you have:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS CLI configured with the appropriate credentials and permissions.
- The remote state configured and working as described in the previous section.

#### Steps to Create Deployment Resources

1. Navigate to the Configuration Directory

First, navigate to the directory where the Terraform configurations for creating the necessary deployment resources are located:

```
cd terraform-aws-app-runner-cicd

terraform init

```

Review the Terraform Plan

```
terraform plan
```

Apply the Terraform Configuration

```
terraform apply --auto-approve
```


### 5. Configure GitHub Secrets

After the Terraform configuration is applied, it will generate outputs, including the ARNs for the IAM roles and the AWS region. These outputs should be added as secrets in your GitHub repository settings:

- **AWS_APP_RUNNER_ROLE**: Set this to the ARN of the App Runner IAM role.
- **AWS_LOGIN_ROLE**: Set this to the ARN of the IAM role used for login/authentication.
- **AWS_REGION**: Set this to the AWS region where your resources are deployed.

To add these secrets:

1. Go to your GitHub repository.
2. Click on **Settings** > **Secrets and variables** > **Actions**.
3. Add the secrets using the output values from the Terraform apply step.
