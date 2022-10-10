# Exercise 12

In this exercise, you will create two new workspaces. Each workspace will use different input values. You will learn to switch between the workspaces to plan the changes.

1. Inspect the existing configuration files.
2. Create two new workspaces, `dev` and `prod`.
3. In the file `locals.tf`, define a variable of type `map` named `instance_config`. The variable should group workspace configuration for each environment. You should end up with a map of maps. Assign the EC2 instance type `t2.nano` to the `dev` workspace, and `t2.micro` to the `prod` workspace. Remove the input variable `instance_type` and use the local variable in `main.tf`.
4. The tags assigned to the EC2 instance should contain an entry for the current environment using the key `Environment`. Add the configuration to the local variable. Continue to use the tags captured through the input variable `tags` and merge them with the value from the local variable in `main.tf`.
5. Execute the `terraform plan` command for the `dev` workspace. Inspect the result.
6. Execute the `terraform plan` command for the `prod` workspace. Inspect the result.
7. Delete both workspaces, `dev` and `prod`.
