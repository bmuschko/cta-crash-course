# Exercise 6

In this exercise, you will define local values in the configuration as a means to provide default values.

1. Inspect the existing configuration in the file named [`main.tf`](./main.tf).
2. Create a new configuration file named `locals.tf` that we'll use to define local values.
3. In the file `locals.tf`, define an map named `timeouts` with two key-value pairs. The map defines the key `create` with the value `60m` and the key `delete` with the value `2h`.
4. Use the local values in the [`aws_db_instance` resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) with the label name `default`.
5. Execute the `plan` command.
