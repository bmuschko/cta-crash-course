# Exercise 3

In this exercise, you will replace some hard-coded values in a Terraform configuration file with input variables. Then you will provide values for the variables from the command line.

1. Inspect the existing configuration in the file named `main.tf`.
2. Create a new configuration file named `variables.tf` that we'll use to define variables.
3. In the configuration file for variables, define a variable for instance type. The variable value should be assigned to the `instance_type` attribute in the resource named `app_server`. Define the default value `t2.nano`, provide a description, and ensure that the end user cannot pass a `null` value.
4. Furthermore, define a variable for the AMI and assign it to the `ami` argument of the resource named `app_server`. The default value should be `ami-077ee47512dc6f3ca`.
5. Lastly, define a variable for the tags used by the resource named `app_server`. Only provide the data type and description for the variable, but no default values.
6. Execute the `terraform plan` command and with and without providing values for the variables with the `-var` option.