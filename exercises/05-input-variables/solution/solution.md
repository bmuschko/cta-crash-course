Create the file named `variables.tf`.

```
$ touch variables.tf
```

Define the variable for the EC2 instance type.

```terraform
variable "instance_type" {
    type = string
    description = "The instance type to use for the EC2 instance."
    default = "t2.nano"
    nullable = false
}
```

Define the variable for providing a specific AMI identifier.

```terraform
variable "ami_id" {
    type = string
    description = "The AMI identifier to use for EC2 instance."
    default = "ami-077ee47512dc6f3ca"
    nullable = false
}
```

The `tags` variable expects key-value pairs. Therefore, the data type needs to be a `map`.

```terraform
variable "tags" {
    type = map(string)
    description = "The tags assigned to the EC2 instance."
}
```

Consume the variables in the resource definition in the file `main.tf`.

```terraform
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
}
```

The `tags` variable does not provide default values. Therefore, the `plan` command will ask you for the values on the command line if you don't define them with the `-var` option.

```
$ terraform plan
var.tags
  The tags assigned to the EC2 instance.

  Enter a value:
```

The following command shows the use of the `-var` option for the `tags` variable.

```
$ terraform plan -var='tags={Environment = "Test", Service = "Example"}'
```

To automatically consume variables from a file, store them in `terraform.tfvars`.

```terraform
tags = {
  Environment = "Test",
  Service = "Example"
}
```

You will not have to define a `-var` CLI option anymore.

```
$ terraform plan
```
