# ex_sre_vois
IoT- Site Reliability Engineer Technical exercise Repository

Terraform AWS Infrastructure Setup
This project provides a Terraform configuration to set up an AWS infrastructure including VPC, EC2 instances, and RDS instances. 

Prerequisites:
--------------
Terraform installed
AWS account with necessary permissions
AWS CLI configured with your credentials

Project Structure:
-----------------
    ```sh
├── main.tf
├── variables.tf
├── outputs.tf
├── modules
│   ├── vpc
│   │   └── main.tf
│   ├── ec2
│   │   └── main.tf
│   └── rds
│       └── main.tf
└── README.md
    ```
Setup:
-----
Step 1: Initialize Terraform
Run the following command to initialize the Terraform configuration. This command downloads the necessary providers and prepares the working directory.

terraform init
Step 2: Review and Apply the Configuration
Run the following command to see what changes will be made to your infrastructure.

terraform plan
If the plan looks good, apply the changes to set up the infrastructure.

terraform apply
You will be prompted to confirm before proceeding. Type yes and press Enter.

Step 3: Access the Outputs
After the apply process is complete, you can see the outputs by running:

terraform output
This will display the VPC ID, public and private subnet IDs, EC2 instance ID, and RDS instance endpoint.

Step 4: Teardown
To destroy the infrastructure and clean up all resources created by Terraform, run the following command:

terraform destroy
You will be prompted to confirm before proceeding. Type yes and press Enter.
