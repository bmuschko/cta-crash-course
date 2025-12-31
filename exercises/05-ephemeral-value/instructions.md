# Exercise 5

In this exercise, you will work with ephemeral values, a Terraform feature that allows you to handle sensitive data without persisting it in state. Ephemeral values exist only during a Terraform run and are never written to state files or plan files, making them ideal for secrets like passwords. You will generate an ephemeral random password, store it in AWS Secrets Manager, and use it to configure an RDS database instance.

1. Create a new configuration file named `main.tf`.
2. Define the AWS provider using the [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest) provider with version 5.87.0 or higher. Configure the region to `us-west-2`.
3. Define the [random](https://registry.terraform.io/providers/hashicorp/random/latest) provider with version 3.7.1 or higher. This provider includes ephemeral resources for generating sensitive values.
4. Define an ephemeral resource using [`random_password`](https://registry.terraform.io/providers/hashicorp/random/latest/docs/ephemeral-resources/password) to generate a secure password. Configure it with a length of 16 characters, include special characters, and override the special character set to `!#$%&*()-_=+[]{}<>:?` to ensure compatibility with RDS.
5. Create an [`aws_secretsmanager_secret`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) resource named `db` to hold the database password. Set the secret name to `db-password`.
6. Create an [`aws_secretsmanager_secret_version`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) resource to store the generated password. Use the `secret_string_wo` write-only argument instead of `secret_string` to pass the ephemeral password value. Write-only arguments accept ephemeral values and ensure the sensitive data is never stored in state. You will also need to set `secret_string_wo_version` to a numeric value (e.g., `1`) which must be incremented whenever you want to update the secret value.
7. Create an [`aws_db_instance`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) resource named `main` with the following configuration:
   - Set the identifier to `main-db`
   - Use `postgres` as the engine
   - Set the instance class to `db.t3.micro`
   - Allocate 20 GB of storage
   - Set the username to `admin`
   - Use the `password_wo` write-only argument to pass the ephemeral password instead of the regular `password` argument. Similar to the secret version, you need to set `password_wo_version` to a numeric value.
   - Set `skip_final_snapshot` to `true` to allow easy cleanup
8. Execute the `terraform init` command to initialize the providers.
9. Execute the `terraform plan` command. Observe how the ephemeral password is referenced but note that no actual password value appears in the plan output.
10. Execute the `terraform apply` command to create the resources. After completion, inspect the state file with `terraform show` and verify that no password values are stored in the state.
11. Destroy the infrastructure with `terraform destroy` once you are done with the exercise.
