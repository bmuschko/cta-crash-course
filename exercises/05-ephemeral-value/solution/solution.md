# Solution

Create the file named `main.tf`.

```
$ touch main.tf
```

Define the required providers with version constraints. The AWS provider needs version 5.87.0+ and the random provider needs version 3.7.1+ to support ephemeral resources and write-only arguments.

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.87.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.7.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}
```

Define an ephemeral resource to generate a random password. Ephemeral resources use the `ephemeral` block instead of `resource`. The password value exists only during the Terraform run and is never stored in state.

```terraform
ephemeral "random_password" "db" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
```

Create the Secrets Manager secret that will hold the database password.

```terraform
resource "aws_secretsmanager_secret" "db" {
  name = "db-password"
}
```

Create the secret version using the `secret_string_wo` write-only argument. Write-only arguments can accept ephemeral values and ensure the sensitive data is never written to state.

```terraform
resource "aws_secretsmanager_secret_version" "db" {
  secret_id             = aws_secretsmanager_secret.db.id
  secret_string_wo      = ephemeral.random_password.db.result
  secret_string_wo_version = 1
}
```

Create the RDS instance using the `password_wo` write-only argument to pass the ephemeral password.

```terraform
resource "aws_db_instance" "main" {
  identifier        = "main-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username            = "admin"
  password_wo         = ephemeral.random_password.db.result
  password_wo_version = 1

  skip_final_snapshot = true
}
```

Initialize the providers.

```
$ terraform init
```

Run the plan command. Notice that the password is referenced but never shown in the output.

```
$ terraform plan
```

Apply the configuration to create the resources.

```
$ terraform apply
```

After applying, inspect the state to verify no password values are stored.

```
$ terraform show
```

You should see that the `password_wo` and `secret_string_wo` attributes are not present in the state output, confirming that the sensitive values were never persisted.

Clean up by destroying the resources.

```
$ terraform destroy
```