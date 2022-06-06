# Exercise 2

In this exercise, you will implement a Terraform configuration file and practice a basic workflow.

1. Create a new Terraform configuration file named `main.tf`.
2. Register the AWS provider named `aws` with the version `4.16.0`. For more information, see the [version on the Terraform registry](https://registry.terraform.io/providers/hashicorp/aws/4.16.0).
3. Define a provider named `aws` in the region `us-west-2`.
4. Define a resource of type `aws_resource` named `app_server`. Assign the AMI `ami-077ee47512dc6f3ca` and the instance type `t2.nano`. For more information on available AMI images, see the [EC2 AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/).
5. In your current shell, export the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` that set the AWS credentials.
6. Run the Terraform command for initializing the project.
7. Run the Terraform commands for planning and deploying the changes.
8. Open the AWS dashboard and find the provisioned AWS instance.
9. Add a second AWS provider that uses the region `us-east-2`. Change the `aws_resource` so that it is going to provision in the `us-east-2` region.
10. Run the Terraform command for deploying the changes. What's the expected outcome of the operation and why?
11. Open the AWS dashboard and find the provisioned AWS instance.
12. Run the Terraform command for deleting the infrastructure.