# Exercise 15

In this exercise, you will use the `import` command to bring an EC2 server under Terraform's management.

1. Create the EC2 instance by running the relevant commands for the existing configuration in the current directory.
2. Identify the resource ID of the EC2 instance in the AWS dashboard.
3. Run the command `terraform state rm aws_instance.app_server` to remove the instance from the local state file and delete the configuration from the `main.tf` file.
4. Perform the relevant actions for bringing the instance under Terraform's management again.
5. Destroy the instance once you are done with the exercise.