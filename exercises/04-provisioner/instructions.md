# Exercise 4

In this exercise, you will define a remote provisioner to execute logic after the creation of an EC2 instance.

1. Inspect the contents of the file [`install_apache.sh`](./install_apache.sh).
2. Define a remote provisioner via `user_data` for the EC2 instance definition `app_server` that uses the shell script.
3. Perform the Terraform command that provisions the resource and executes the user data.
4. Find information about the user data in the AWS console for the instance.
5. Run the Terraform command for deleting the infrastructure.
