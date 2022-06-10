# Exercise 8

In this exercise, you extract existing configuration into a local module while following best practices. The root module will then consume the child module.

1. Inspect the existing configuration in the file named `main.tf`.
2. Extract the creation of the `aws_instance` into a child module named `ec2` in the subdirectory `module`.
3. Expose input variables for the AMI and tags. Create the variables in the file `variables.tf`.
4. Capture the private IP of the EC2 instance in an output value named `private_ip`.
5. Consume the child module from the root module. Provide the same input values you saw in the initial state of the exercise.
6. Execute the `plan` command.
