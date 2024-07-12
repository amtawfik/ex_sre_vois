# ex_sre_vois
IoT- Site Reliability Engineer Technical exercise Repository

Project Structure
Your Terraform project structure should look like this:

aws-terraform-infra/
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── lambda/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── api_gateway/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
└── README.md

# AWS Terraform Infrastructure

## Setup

1. Ensure you have Terraform installed. You can download it from [here](https://www.terraform.io/downloads.html).

2. Configure your AWS credentials.

3. Initialize Terraform:
    ```sh
    terraform init
    ```

4. Review the plan:
    ```sh
    terraform plan
    ```

5. Apply the configuration:
    ```sh
    terraform apply
    ```

## Teardown

1. To destroy the infrastructure:
    ```sh
    terraform destroy
    ```

## Notes

- Ensure that your AWS user has the necessary permissions to create and manage the resources.
- Modify `terraform.tfvars` to customize variables for your environment.
