# Exercise 5

In this exercise, you will define local values in the configuration as a means to provide default values.

1. Inspect the existing configuration in the file named `main.tf`.
2. Create a new configuration file named `locals.tf` that we'll use to define local values.
3. In the file `locals.tf`, define an object named `timeouts` with two attributes. The object defines the attribute `create` with the value `60m` and the attribute `delete` with the value `2h`.
4. Use the local values in the [`aws_db_instance` resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) named `default`.
5. Execute the `plan` command.