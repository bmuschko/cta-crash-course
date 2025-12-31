# Solution

The `main.tf` configuration file directly defines AWS credentials in plain-text. Those variable values would be stored in the state file and therefore this configuration is not safe. You should remove the value assignment. You should use environment variables or a AWS credentials file instead. Remove the following lines from the configuration file.

```terraform
access_key = "abc"
secret_key = "def"
```

Execute the `validate` command. You will see the following errors.

```
$ terraform validate
╷
│ Error: Invalid block definition
│
│   on main.tf line 10:
│   10: provider "aws"
│   11: {
│
│ A block definition must have block content delimited by "{" and "}", starting on the same line
│ as the block header.
╵
╷
│ Error: Missing required argument
│
│   on outputs.tf line 1, in output "app_server_public_ip":
│    1: output "app_server_public_ip" {
│
│ The argument "value" is required, but no definition was found.
╵
╷
│ Error: Unsupported argument
│
│   on outputs.tf line 2, in output "app_server_public_ip":
│    2:   val = aws_instance.app_server.public_ip
│
│ An argument named "val" is not expected here. Did you mean "value"?
```

Fix the first error message by moving the opening curly brace of the AWS provider to the same line as the defintion. The resulting code will look as follows.

```terraform
provider "aws" {
      region = "us-west-2"
}
```

The next error message indicates the attribute named `value` has not been defined in the output value in the file `outputs.tf`. Change the code from `val` to `value`.

```terraform
output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
  description = "The public IP address of the EC2 server instance."
}
```

Another issue may see is the following:

```
$ terraform validate
╷
│ Error: Invalid reference
│
│   on main.tf line 15, in resource "aws_instance" "app_server":
│   15:   ami = var_ami_id
│
│ A reference to a resource type must be followed by at least one attribute access, specifying
│ the resource name.
```

This can be fixed by referencing the input variable named `ami_id` properly. Use `var.ami_id` instead of `var_ami_id`.

```terraform
resource "aws_instance" "app_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = [var.tags]
}
```

The last error you will encounter is the assignment to the `tags` attribute. We are trying to wrap a `map` defined by the `tags` input variables into a list.

```
$ terraform validate
╷
│ Error: Incorrect attribute value type
│
│   on main.tf line 17, in resource "aws_instance" "app_server":
│   17:   tags = [var.tags]
│     ├────────────────
│     │ var.tags is a map of string, known only after apply
│
│ Inappropriate value for attribute "tags": map of string required.
```

Fix this by removing the square brackets.

```terraform
resource "aws_instance" "app_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
}
```

The `validate` command should find no more errors in the configuration files.

```
$ terraform validate
Success! The configuration is valid.
```

The `fmt` command reformats the following files.

```
$ terraform fmt
main.tf
outputs.tf
variables.tf
```